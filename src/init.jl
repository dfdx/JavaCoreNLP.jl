
function init()
    envcp = get(ENV, "CLASSPATH", "")
    wrapper_assembly = joinpath(dirname(@__FILE__), "..", "jvm", "corenlp-wrapper", "target", "corenlp-wrapper-0.1-assembly.jar")
    classpath = @static is_windows() ? "$envcp;$wrapper_assembly" : "$envcp:$wrapper_assembly"
    try
        # prevent exceptions in REPL on code reloading
        JavaCall.init(["-ea", "-Xmx4048M", "-Djava.class.path=$classpath"])
    end
end

init()
