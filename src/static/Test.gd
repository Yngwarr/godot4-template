class_name Test
extends Object

## To test something, add a test function and call it with Test.run in the
## beggining of _ready function in a node you're testing. In that funciton, you
## should use Test.are_eq for your assertions. Errors will appear in the
## console when your node is initialized.

const TESTS_ARE_FATAL := false

static func are_eq(actual: Variant, expected: Variant, msg := "test failed") -> void:
	if actual == expected:
		return

	if TESTS_ARE_FATAL:
		assert(false, "%s, expected %s, got %s" % [msg, expected, actual])
	else:
		push_error("%s, expected %s, got %s" % [msg, expected, actual])

static func run(fn: Callable) -> void:
	if OS.has_feature("standalone"):
		return

	fn.call()
