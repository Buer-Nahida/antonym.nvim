<h1 align="center">antonym.nvim</h1>
<h4 align="center">Super-simple neovim plugin for cycling through antonyms/words related to word under cursor</h4>

<!--toc:start-->
- [Install](#install)
- [Configuration](#configuration)
- [Using](#using)
<!--toc:end-->

## Install

**lazy.nvim**

```lua
{
  "SR-MyStar/antonym.nvim",
  opts = {
    -- ...
  },
}
```

or use Lazy-load feature

```lua
{
  "SR-Mystar/antonym.nvim",
  lazy = true,
  cmd = "Antonym",
  opts = {
    -- ...
  },
  keys = {
    -- ...
  },
}
```

## Configuration

If you only want cycling through antonym

```lua
opts = {
    only_antonym = true,
    words = {
        ["example1"] = "antonym1",
        ["example2"] = "antonym2",
    }
}
```

else, you can do it

```lua
opts = {
    words = {
        { "example1", "other-word1","other-word2" },
        { "example2", "other-word1","other-word2" },
    }
}
```

## Using

```vim
:Antonym
```

or, use lua

```vim
:lua require("antonym").change()
```
