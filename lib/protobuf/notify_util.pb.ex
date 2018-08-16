defmodule NotifyUtil.PingRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          username: String.t()
        }
  defstruct [:username]

  field :username, 1, type: :string
end

defmodule NotifyUtil.PingResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          msg: String.t()
        }
  defstruct [:msg]

  field :msg, 1, type: :string
end

defmodule NotifyUtil.SendSmsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          phone_num: String.t(),
          template_name: String.t(),
          template_param: String.t()
        }
  defstruct [:phone_num, :template_name, :template_param]

  field :phone_num, 1, type: :string
  field :template_name, 2, type: :string
  field :template_param, 3, type: :string
end

defmodule NotifyUtil.DefaultResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: String.t(),
          msg: String.t()
        }
  defstruct [:status, :msg]

  field :status, 1, type: :string
  field :msg, 2, type: :string
end

defmodule NotifyUtil.SendEmailRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          subject: String.t(),
          content_type: String.t(),
          content: String.t(),
          to_address: String.t()
        }
  defstruct [:subject, :content_type, :content, :to_address]

  field :subject, 1, type: :string
  field :content_type, 2, type: :string
  field :content, 3, type: :string
  field :to_address, 4, type: :string
end

defmodule NotifyUtil.Server.Service do
  @moduledoc false
  use GRPC.Service, name: "NotifyUtil.Server"

  rpc :ping, NotifyUtil.PingRequest, NotifyUtil.PingResponse
  rpc :send_sms, NotifyUtil.SendSmsRequest, NotifyUtil.DefaultResponse
  rpc :send_email, NotifyUtil.SendEmailRequest, NotifyUtil.DefaultResponse
end

defmodule NotifyUtil.Server.Stub do
  @moduledoc false
  use GRPC.Stub, service: NotifyUtil.Server.Service
end
