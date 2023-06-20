defmodule ProtoModels.Proto.Person do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string
  field :age, 2, type: :int32
  field :hobbies, 3, repeated: true, type: :string
end
