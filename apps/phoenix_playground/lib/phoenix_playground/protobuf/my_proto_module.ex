defmodule PhoenixPlayground.Protobuf.MyProtoModule do
  alias ProtoModels.Proto.Person

  def create_person(name, age, hobbies) do
    person = %Person{name: name, age: age, hobbies: hobbies}
    binary = Protobuf.encode(person)
    {:ok, binary}
  end

  def decode_person(binary) do
    Protobuf.decode(binary, Person)
    |> IO.inspect(label: "decode_person")
  end
end
