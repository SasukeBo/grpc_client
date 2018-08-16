defmodule ClassifyUtil.PingRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field :name, 1, type: :string
end

defmodule ClassifyUtil.PingResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message: String.t()
        }
  defstruct [:message]

  field :message, 1, type: :string
end

defmodule ClassifyUtil.ResetRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reset: boolean
        }
  defstruct [:reset]

  field :reset, 1, type: :bool
end

defmodule ClassifyUtil.AlterCorpusRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path_or_text: String.t(),
          categories: [String.t()],
          path: boolean
        }
  defstruct [:path_or_text, :categories, :path]

  field :path_or_text, 1, type: :string
  field :categories, 2, repeated: true, type: :string
  field :path, 3, type: :bool
end

defmodule ClassifyUtil.DefaultResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: String.t(),
          message: String.t()
        }
  defstruct [:status, :message]

  field :status, 1, type: :string
  field :message, 2, type: :string
end

defmodule ClassifyUtil.ClassifyRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path_or_text: String.t(),
          limit: integer,
          path: boolean
        }
  defstruct [:path_or_text, :limit, :path]

  field :path_or_text, 1, type: :string
  field :limit, 2, type: :int32
  field :path, 3, type: :bool
end

defmodule ClassifyUtil.Result do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          category: String.t(),
          value: float
        }
  defstruct [:category, :value]

  field :category, 1, type: :string
  field :value, 2, type: :float
end

defmodule ClassifyUtil.ClassifyResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          results: [ClassifyUtil.Result.t()]
        }
  defstruct [:results]

  field :results, 1, repeated: true, type: ClassifyUtil.Result
end

defmodule ClassifyUtil.Server.Service do
  @moduledoc false
  use GRPC.Service, name: "ClassifyUtil.Server"

  rpc :classify, ClassifyUtil.ClassifyRequest, ClassifyUtil.ClassifyResponse
  rpc :train, ClassifyUtil.AlterCorpusRequest, ClassifyUtil.DefaultResponse
  rpc :give_up, ClassifyUtil.AlterCorpusRequest, ClassifyUtil.DefaultResponse
  rpc :reset, ClassifyUtil.ResetRequest, ClassifyUtil.DefaultResponse
  rpc :ping, ClassifyUtil.PingRequest, ClassifyUtil.PingResponse
end

defmodule ClassifyUtil.Server.Stub do
  @moduledoc false
  use GRPC.Stub, service: ClassifyUtil.Server.Service
end
