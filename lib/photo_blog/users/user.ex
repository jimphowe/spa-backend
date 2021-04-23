defmodule Events.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password_hash, :string

    has_many :posts, Events.Posts.Post
    has_many :comments, Events.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    password = attrs["password"]
    |> cast(attrs, [:name])
    |> validate_password
    |> add_password_hash(attrs["password"])
    |> validate_required([:name, :password_hash])
  end

  def add_password_hash(cset, nil) do
    cset
  end

  def add_password_hash(cset, password) do
    change(cset, Argon2.add_hash(password))
  end

  def validate_password(_x) do
    # Password >= 8 characters
    # Password not in common dictionary
  end
end
