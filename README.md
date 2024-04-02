# Alphanumeric2cjk

Compressing the alphanumberic(0-9a-zA-Z) string to valid [cjk](https://en.wikipedia.org/wiki/CJK_characters) characters(\u0x4e00-\u0x9fff).

For example, "abc123DEF" -> "伫斪犌塱".

## why?

Common databases have a character size limit of fields, fortunately, they also have good
utf8 support, such as PostgreSQL. When a string in alphanumberic exceed the size limit, we 
can compress it to a tighter encoding to save the characters. CJK characters is widely used 
in asia, many computers can read and display them correctly. 

## how to use

see `lib/alphanumeric2cjk.ex`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `alphanumeric2cjk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:alphanumeric2cjk, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/alphanumeric2cjk](https://hexdocs.pm/alphanumeric2cjk).

