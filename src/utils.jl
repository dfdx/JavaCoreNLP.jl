

function set_property(jprops::JProperties, key::AbstractString, value::AbstractString)
    jcall(jprops, "setProperty", JObject, (JString, JString), key, value)
end


function get_property(jprops::JProperties, key::AbstractString)
    return jcall(jprops, "getProperty", JString, (JString,), key)
end


function to_jprops(d::Dict{String, String})
    jprops = JProperties(())
    for (k, v) in d
        set_property(jprops, k, v)
    end
    return jprops
end
