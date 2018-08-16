defmodule PushUtil.PingRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field :name, 1, type: :string
end

defmodule PushUtil.PingResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message: String.t()
        }
  defstruct [:message]

  field :message, 1, type: :string
end

defmodule PushUtil.AlterUserDeviceRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user_id: String.t(),
          device_system: String.t(),
          user_token: String.t()
        }
  defstruct [:user_id, :device_system, :user_token]

  field :user_id, 1, type: :string
  field :device_system, 2, type: :string
  field :user_token, 3, type: :string
end

defmodule PushUtil.SendMsgRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          title: String.t(),
          description: String.t(),
          content: String.t(),
          user_id: String.t()
        }
  defstruct [:title, :description, :content, :user_id]

  field :title, 1, type: :string
  field :description, 2, type: :string
  field :content, 3, type: :string
  field :user_id, 4, type: :string
end

defmodule PushUtil.DefaultResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg: String.t(),
          status: String.t()
        }
  defstruct [:msg, :status]

  field :msg, 1, type: :string
  field :status, 2, type: :string
end

defmodule PushUtil.Server.Service do
  @moduledoc false
  use GRPC.Service, name: "PushUtil.Server"

  rpc :send_msg, PushUtil.SendMsgRequest, PushUtil.DefaultResponse
  rpc :add_user_device, PushUtil.AlterUserDeviceRequest, PushUtil.DefaultResponse
  rpc :delete_user_device, PushUtil.AlterUserDeviceRequest, PushUtil.DefaultResponse
  rpc :ping, PushUtil.PingRequest, PushUtil.PingResponse
end

defmodule PushUtil.Server.Stub do
  @moduledoc false
  use GRPC.Stub, service: PushUtil.Server.Service
end
