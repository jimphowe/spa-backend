defmodule Events.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :eventname, :string
    field :date, :string
    field :body, :string
    belongs_to :user, Events.Users.User
    has_many :comments, Events.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:eventname, :date, :body, :user_id])
    |> validate_required([:eventname, :date, :body, :user_id])
  end
end
