
# ?base::* functions are in .GlobalEnv
expect_all_true(object = {
  exists('matrix', where = .GlobalEnv)
  exists('matrix', where = asNamespace('base'), inherits = FALSE)
  exists('matrix', where = baseenv())
})


foo <- \() print('hello world')

print(environment(foo))

expect_no_error(object = {
  foo()  
})

if (FALSE) {
  
  expect_identical(
    object = environment(foo),
    expected = .GlobalEnv
  ) # wont work while devtools::test()

  expect_all_true(object = {
    exists('foo', where = .GlobalEnv)
  }) # wont work while devtools::test()
  
}


expect_all_false(object = {
  exists('foo', where = asNamespace('base'), inherits = FALSE)
  exists('foo', where = baseenv())
})

