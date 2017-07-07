
using JavaCall


JProperties = @jimport java.util.Properties
JStanfordCoreNLP = @jimport edu.stanford.nlp.pipeline.StanfordCoreNLP
JAnnotation = @jimport edu.stanford.nlp.pipeline.Annotation

include("init.jl")
include("utils.jl")
include("pipeline.jl")


function my_test()
    # example from https://stanfordnlp.github.io/CoreNLP/api.html
    pipeline = StanfordCoreNLP(Dict("annotations" =>
                                    "tokenize, ssplit, pos, lemma, ner, parse, dcoref"))
    doc = Annotation("The Beatles were an English rock band formed in Liverpool in 1960.")
    annotate!(pipeline, doc)
end



# A very quick introduction to JavaCall:
#
# 1. Import class and give it a name in Julia:
#
#      JProperties = @jimport java.util.Properties
#      JStanfordCoreNLP = @jimport edu.stanford.nlp.pipeline.StanfordCoreNLP      
#
# 2. Create an instance of this class:
#
#      jprops = JProperties(())
#      corenlp = JStanfordCoreNLP((JProperties), jprops)
#
#    The 1st argument is a tuple of types of this constructor, the rest 
#    are actual arguments(instances of other classes)
#
# 3. Call a method of this instance
#
#      jcall(jprops, "setProperty", JObject, (JString, JString), "foo", "bar")
#
#    The arguments are:
#
#      * jprops - instance of Java class or class itself
#      * "setProperty" - name of a method
#      * JObject - return type
#      * (JString, JString) - tuple of method argument types
#      * key, value - actual arguments
#
# See more in official docs: http://juliainterop.github.io/JavaCall.jl/

