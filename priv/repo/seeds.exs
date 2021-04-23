# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Events.Repo.insert!(%Events.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Events.Repo
alias Events.Users.User
alias Events.Posts.Post

defmodule Inject do
  def user(name, pass) do
    hash = Argon2.hash_pwd_salt(pass)
    Repo.insert!(%User{name: name, password_hash: hash})
  end
end

fred = Inject.user("fred", "fred123")
alice = Inject.user("alice", "alice123")

p1 = %Post{
  user_id: fred.id,
  eventname: "Birthday party",
  date: "May 25th",
  body: "Come to my birthday!"
}
Repo.insert!(p1)

p2 = %Post{
  user_id: alice.id,
  eventname: "Hiking Trip",
  date: "March 22nd",
  body: "Come hike mt everest with me!!"
}
Repo.insert!(p2)
