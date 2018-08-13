defmodule WordUtil.GetWordsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          opt: String.t()
        }
  defstruct [:opt]

  field :opt, 1, type: :string
end

defmodule WordUtil.Word do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content: String.t(),
          substitute: String.t(),
          level: integer,
          published: boolean,
          is_regex: boolean
        }
  defstruct [:content, :substitute, :level, :published, :is_regex]

  field :content, 1, type: :string
  field :substitute, 2, type: :string
  field :level, 3, type: :int32
  field :published, 4, type: :bool
  field :is_regex, 5, type: :bool
end

defmodule WordUtil.FilterResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clean_sentence: String.t(),
          hit_sensitive_words: [WordUtil.Word.t()],
          notify: boolean,
          refuse: boolean
        }
  defstruct [:clean_sentence, :hit_sensitive_words, :notify, :refuse]

  field :clean_sentence, 1, type: :string
  field :hit_sensitive_words, 2, repeated: true, type: WordUtil.Word
  field :notify, 3, type: :bool
  field :refuse, 4, type: :bool
end

defmodule WordUtil.GetWordsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: String.t(),
          message: String.t(),
          words: [WordUtil.Word.t()]
        }
  defstruct [:status, :message, :words]

  field :status, 1, type: :string
  field :message, 2, type: :string
  field :words, 3, repeated: true, type: WordUtil.Word
end

defmodule WordUtil.PingRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          age: integer
        }
  defstruct [:name, :age]

  field :name, 1, type: :string
  field :age, 2, type: :int32
end

defmodule WordUtil.DefaultResponse do
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

defmodule WordUtil.AddWordRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content: String.t(),
          substitute: String.t(),
          level: integer,
          published: boolean,
          is_regex: boolean
        }
  defstruct [:content, :substitute, :level, :published, :is_regex]

  field :content, 1, type: :string
  field :substitute, 2, type: :string
  field :level, 3, type: :int32
  field :published, 4, type: :bool
  field :is_regex, 5, type: :bool
end

defmodule WordUtil.FindWordRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content: String.t()
        }
  defstruct [:content]

  field :content, 1, type: :string
end

defmodule WordUtil.FilterWordsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sentence: String.t(),
          mode: String.t(),
          gen_anchor: boolean,
          type: String.t()
        }
  defstruct [:sentence, :mode, :gen_anchor, :type]

  field :sentence, 1, type: :string
  field :mode, 2, type: :string
  field :gen_anchor, 3, type: :bool
  field :type, 4, type: :string
end

defmodule WordUtil.Anchor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content: String.t(),
          url: String.t()
        }
  defstruct [:content, :url]

  field :content, 1, type: :string
  field :url, 2, type: :string
end

defmodule WordUtil.GetAnchorsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: String.t(),
          anchors: [WordUtil.Anchor.t()],
          message: String.t()
        }
  defstruct [:status, :anchors, :message]

  field :status, 1, type: :string
  field :anchors, 2, repeated: true, type: WordUtil.Anchor
  field :message, 3, type: :string
end

defmodule WordUtil.SetAnchorRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content: String.t(),
          url: String.t()
        }
  defstruct [:content, :url]

  field :content, 1, type: :string
  field :url, 2, type: :string
end

defmodule WordUtil.Server.Service do
  @moduledoc false
  use GRPC.Service, name: "WordUtil.Server"

  rpc :ping, WordUtil.PingRequest, WordUtil.DefaultResponse
  rpc :set_dirty_word, WordUtil.AddWordRequest, WordUtil.DefaultResponse
  rpc :delete_dirty_word, WordUtil.FindWordRequest, WordUtil.DefaultResponse
  rpc :get_dirty_words, WordUtil.GetWordsRequest, WordUtil.GetWordsResponse
  rpc :filter_dirty_words, WordUtil.FilterWordsRequest, WordUtil.FilterResponse
  rpc :find_dirty_word, WordUtil.FindWordRequest, WordUtil.GetWordsResponse
  rpc :set_anchor, WordUtil.SetAnchorRequest, WordUtil.GetAnchorsResponse
  rpc :delete_anchor, WordUtil.FindWordRequest, WordUtil.GetAnchorsResponse
  rpc :get_anchors, WordUtil.GetWordsRequest, WordUtil.GetAnchorsResponse
  rpc :find_anchor, WordUtil.FindWordRequest, WordUtil.GetAnchorsResponse
end

defmodule WordUtil.Server.Stub do
  @moduledoc false
  use GRPC.Stub, service: WordUtil.Server.Service
end
