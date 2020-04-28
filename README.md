# vim-break

An easy line splitter. Motivation: I deal with a lot of binary data every day at work, and I wanna make shaping them easier.

# Installation

Use your favorite plugin manager.

# Usecase and Usage

## Split lines on every fourth comma 

Select lines with virtualmode and run `:Break , 4`.

```golang
bindata := []byte{0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c,
 0x1d, 0x1e, 0x1f, 0x20, 0x21}
```

The results are as follows.

```golang
bindata := []byte{0x01, 0x02, 0x03, 0x04,
 0x05, 0x06, 0x07, 0x08,
 0x09, 0x0a, 0x0b, 0x0c,
 0x0d, 0x0e, 0x0f, 0x10,
 0x11, 0x12, 0x13, 0x14,
 0x15, 0x16, 0x17, 0x18,
 0x19, 0x1a, 0x1b, 0x1c
 0x1d, 0x1e, 0x1f, 0x20,
 0x21}
```

## Split lines on every magic number

`:Break 9f 1`. It's same as `:'<,'>s/9f/9f\r/g`.

```
1019f3303204000950580000100009f37049badbcab9f100706010a03a000009f2608aabbc1df341bc3899f360200f0820200009c
```

will be

```
1019f
3303204000950580000100009f
37049badbcab9f
100706010a03a000009f
2608aabbc1df341bc3899f
360200f0820200009c
```

## Split lines on every tenth space 

`:BreakSpace 10`

```
a b c d e f g h i j k l m n
```

will be

```
a b c d e f g h i j 
k l m n
```

# License

MIT