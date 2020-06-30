"""
    manifest(c::Pkg.Types.Context)
Retrieves the manifest of a Context.
"""
manifest(c::Pkg.Types.Context) = c.env.manifest

"""
    project(c::Pkg.Types.Context)
Retrieves the project of a Context.
"""
project(c::Pkg.Types.Context) = c.env.project

"""
    isinproject(context, package::Union{String,UUID})
Checks whether a package is in the dependencies of a given context, e.g. is directly loadable.
"""
function isinproject end

"""
    isinmanifest(context, package::Union{String,UUID})
Checks whether a package is in the manifest of a given context, e.g. is either directly loadable or is a dependency of an loadable package.
"""
function isinmanifest end

"""
    find_parent(c, package::Union{String,UUID})
Finds all loadable packages for which `package` is a dependency.
"""
find_parent(c::Pkg.Types.Context, name::String, out = Set{UUID}()) = find_parent(c, packageuuid(c, name), out)
function find_parent(c::Pkg.Types.Context, uuid::UUID, out = Set{UUID}())
    for pkg in manifest(c)
        if uuid in values(deps(packageuuid(pkg), c))
            if isinproject(c, packagename(pkg))
                push!(out, packageuuid(pkg))
            else
                find_parent(c, packageuuid(pkg), out)
            end
        end
    end
    return out
end

@static if VERSION < v"1.1"
    isinmanifest(context::Pkg.Types.Context, module_name::String) = module_name in keys(manifest(context))
    isinmanifest(context::Pkg.Types.Context, uuid::UUID) = any(get(p[1], "uuid", "") == string(uuid) for (u,p) in manifest(context))

    isinproject(context::Pkg.Types.Context, package_name::String) = haskey(deps(project(context)), package_name)
    isinproject(context::Pkg.Types.Context, package_uuid::UUID) = any(u == package_uuid for (n,u) in deps(project(context)))

    function packageuuid(c::Pkg.Types.Context, name::String)
        for pkg in manifest(c)
            if first(pkg) == name
                return UUID(last(pkg)[1]["uuid"])
            end
        end
    end
    packageuuid(pkg::Pair{Any,Any}) = last(pkg) isa String ? UUID(last(pkg)) : UUID(first(last(pkg))["uuid"])
    packageuuid(pkg::Pair{String,Any}) = last(pkg) isa String ? UUID(last(pkg)) : UUID(first(last(pkg))["uuid"])

    function packagename(c::Pkg.Types.Context, uuid)
        for (n,p) in c.env.manifest
            if get(first(p), "uuid", "") == string(uuid)
                return n
            end
        end
        return nothing
    end

    function deps(uuid::UUID, c::Pkg.Types.Context)
        if any(p[1]["uuid"] == string(uuid) for (n,p) in manifest(c))
            return manifest(c)[string(uuid)][1].deps
        else
            return Dict{Any,Any}()
        end
    end
    deps(d::Dict{String,Any}) = get(d, "deps", Dict{String,Any}())
    deps(pe::PackageEntry) = get(pe[1], "deps", Dict{String,Any}())
    path(pe::PackageEntry) = get(pe[1], "path", nothing)
    version(pe::PackageEntry) = get(pe[1], "version", nothing)

    function frommanifest(c::Pkg.Types.Context, uuid)
        for (n,p) in c.env.manifest
            if get(first(p), "uuid", "") == string(uuid)
                return p
            end
        end
        return nothing
    end
else
    isinmanifest(context::Pkg.Types.Context, module_name::String) = any(p.name == module_name for (u,p) in manifest(context))
    isinmanifest(context::Pkg.Types.Context, uuid::UUID) = haskey(manifest(context), uuid)

    isinproject(context::Pkg.Types.Context, package_name::String) = haskey(deps(project(context)), package_name)
    isinproject(context::Pkg.Types.Context, package_uuid::UUID) = any(u == package_uuid for (n,u) in deps(project(context)))

    function packageuuid(c::Pkg.Types.Context, name::String)
        for pkg in manifest(c)
            if last(pkg).name == name
                return first(pkg)
            end
        end
    end
    packageuuid(pkg::Pair{String,UUID}) = last(pkg)
    packageuuid(pkg::Pair{UUID,PackageEntry}) = first(pkg)
    packagename(c::Pkg.Types.Context, uuid::UUID) = manifest(c)[uuid].name

    function deps(uuid::UUID, c::Pkg.Types.Context)
        if haskey(manifest(c), uuid)
            return deps(manifest(c)[uuid])
        else
            return Dict{String,Base.UUID}()
        end
    end
    deps(pe::PackageEntry) = pe.deps
    deps(proj::Pkg.Types.Project) = proj.deps
    deps(pkg::Pair{String,UUID}, c::Pkg.Types.Context) = deps(packageuuid(pkg), c)
    path(pe::PackageEntry) = pe.path
    version(pe::PackageEntry) = pe.version
    frommanifest(c::Pkg.Types.Context, uuid) = manifest(c)[uuid]
end


"""
    tryaccess(root::Module, target::Symbol, visited = Set{Module}())
Traverses all submodules of `root` to search for the module `target`.
"""
function tryaccess(root::Module, target::Symbol, visited = Set{Module}())
    root in visited && return nothing
    push!(visited, root)
    try
        return getfield(root, target)
    catch err
    end
    for n in names(root, all = true, imported = true)
        !isdefined(root, n) && continue
        x = getfield(root, n)
        if x isa Module
            y = tryaccess(x, target, visited)
            if y isa Module && nameof(y) == target
                return y
            end
        end
    end
    return nothing
end

function can_access(m::Module, s::Symbol)
    try
        return Base.eval(m, :($m.$s))
    catch
        return nothing
    end
end

function change_env(c, pe)
    if path(pe) isa String
        env_path = path(pe)
        Pkg.API.activate(env_path)
    elseif !is_stdlib(c, packageuuid(pe)) && ((Pkg.API.dir(packagename(pe)) isa String) &&!isempty(Pkg.API.dir(packagename(pe))))
        env_path = Pkg.API.dir(packagename(pe))
        Pkg.API.activate(env_path)
    end
end

function sha2_256_dir(path, sha = sha = zeros(UInt8, 32))
    (uperm(path) & 0x04) != 0x04 && return
    startswith(path, ".") && return
    if isfile(path) && endswith(path, ".jl")
        s1 = open(path) do f
            sha2_256(f)
        end
        sha .+= s1
    elseif isdir(path)
        for f in readdir(path)
            sha = sha2_256_dir(joinpath(path, f), sha)
        end
    end
    return sha
end

function sha_pkg(pe::PackageEntry)
    path(pe) isa String && isdir(path(pe)) && isdir(joinpath(path(pe), "src")) ? sha2_256_dir(joinpath(path(pe), "src")) : nothing
end

function _lookup(tr::PackageRef{N}, depot::Dict{String,ModuleStore}) where N
    if haskey(depot, tr.name[1])
        if N == 1
            return depot[tr.name[1]]
        else
            return _lookup(tr, depot[tr.name[1]], 2)
        end
    end
end

function _lookup(tr::PackageRef{N}, m::ModuleStore, i) where N
    if i < N && haskey(m.vals, tr.name[i])
        _lookup(tr, m.vals[tr.name[i]], i + 1)
    elseif i == N && haskey(m.vals, tr.name[i])
        return m.vals[tr.name[i]]
    end
end