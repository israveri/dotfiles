# Cheatsheet file to check [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) nvim plugin rendering customizations

---

# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

---

# Heading

Single line paragraph.

Line 1 of paragraph,
Line 2 of paragraph,
Line 3 of paragraph.

Another line paragraph.

---

# Code Blocks

```python
def main() -> None:
    print("Hello, World!")
```

```rust
fn main() {
    println!("Hello, World!");
}
```

---

# List

- Nest 0 Item 1
  - Nest 1 Item 1
  - Nest 1 Item 2
    - Nest 2 Item 1
      - Nest 3 Item 1
        - Nest 4 Item 1
- Nest 0 Item 2
  - Nest 1 Item 3

---

# Checkboxes

- [ ] Unchecked
- [x] Checked
- [-] Todo
- [~] Custom

---

# Normal Quote

> A modest length quote
> Split over
> Multiple lines

# Really Long Quote

> Just a long line
> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut eleifend metus. Proin velit dui, suscipit in viverra eu, scelerisque dictum elit.

---

# Table


| `Left` | *Center* | Right  | Default |
|  :---  | :----:   |-------:| --------|
| `Code` | **Bold** | ~~Strike~~ |Item     |
| Item   | [Link](/test) | Item   |  Item   |
|       1| 2        | 3      | 4       |


---

# Callouts

> [!NOTE]
>
> A regular note
> With a second paragraph

> [!WARNING] Custom Title

---

# Links

- ![Image](test.png)
- [Markdown File](test.md)
- [Python File](test.py)
- [Website](https://test.com)
- [[wikilink]]
- [[wikilink|Wikilink Alias]]
- [Reference][example]
- <user@test.com>

---

# Heading 1

Some content.

## Heading 2

> [!NOTE]
> A callout note

### Heading 3

```python
print("Hello, World!")
```

## Heading 2

- List Item 1
- List Item 2
  - Nested List Item 1

### Heading 3

More content

#### Heading 4

| First | Second |
| :---- | ------ |
| Item  | Item   |
