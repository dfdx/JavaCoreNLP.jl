
## Annotation

struct Annotation
    jann::JAnnotation
end


# TODO: make more meaningful show
Base.show(io::IO, ann::Annotation) = print(io, "Annotation(...)")


function Annotation(text::AbstractString)
    jann = JAnnotation((JString,), text)
    return Annotation(jann)
end



## StanfordCoreNLP

struct StanfordCoreNLP
    jpipeline::JStanfordCoreNLP
end

Base.show(io::IO, pipeline::StanfordCoreNLP) = print(io, "StanfordCoreNLP(...)")


function StanfordCoreNLP(props::Dict{String, String})
    jprops = to_jprops(props)
    jpipeline = JStanfordCoreNLP((JProperties,), jprops)
    return StanfordCoreNLP(jpipeline)
end


function annotate!(pipeline::StanfordCoreNLP, doc::Annotation)
    jcall(pipeline.jpipeline, "annotate", Void, (JAnnotation,), doc.jann)
end


