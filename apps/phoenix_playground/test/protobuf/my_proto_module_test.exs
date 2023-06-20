defmodule Protobuf.MyProtoModuleTest do
  use ExUnit.Case, async: true

  alias PhoenixPlayground.Protobuf.MyProtoModule

  test "create_person" do
    assert {:ok, person} = MyProtoModule.create_person("haha", 15, ["no","nothing"])
    assert is_binary(person)
  end

  test "decode_person" do
    assert {:ok, person} = MyProtoModule.create_person("haha", 15, ["no","nothing"])
    assert %ProtoModels.Proto.Person{
      name: "haha",
      age: 15,
      hobbies: ["no", "nothing"]
    } = MyProtoModule.decode_person(person)
  end
end
