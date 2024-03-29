train_models <- function(corpus, algorithms, ...) {
# helper method to make it easier to train models by algorithm name(s)
# output is a list(algorithm_name=model, ..) 
# hopefully, this method can disappear after refactoring train_model
	result = list()
	for (algorithm in algorithms) {
		model = train_model(corpus, algorithm, ...)
		result[[algorithm]] = model
	}
	
	return(result)
}