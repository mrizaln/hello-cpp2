include(FetchContent)

FetchContent_Declare(
  secret-string
  GIT_REPOSITORY https://github.com/mrizaln/secret-string
  GIT_TAG 880dd19d518670d8baa18f720b5428778768cd00)
FetchContent_MakeAvailable(secret-string)
