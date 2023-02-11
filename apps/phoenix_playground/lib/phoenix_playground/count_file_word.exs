alias PhoenixPlayground.Stream

Benchee.run(
  %{
    "enum" => fn input -> Stream.count_file_word_with_enum(input) end,
    "stream" => fn input -> Stream.count_file_word_with_stream(input) end,
    "flow" => fn input -> Stream.count_file_word_with_flow(input) end
  },
  inputs: %{
    "Small" => "MOCK_DATA_SMALL.txt",
    "Medium" => "MOCK_DATA_MEDIUM.txt",
    "Bigger" => "MOCK_DATA_BIG.txt",
    "Huge" => "MOCK_DATA_HUGE.txt"
  },
  formatters: [
    {Benchee.Formatters.HTML, file: "apps/phoenix_playground/lib/phoenix_playground/count_file_word_output/test.html"}
  ]
)
