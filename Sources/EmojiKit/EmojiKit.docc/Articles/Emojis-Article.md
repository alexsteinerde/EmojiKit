# Emojis

This article describes the EmojiKit emoji model.

@Metadata {
    
    @PageImage(
        purpose: card,
        source: "Page",
        alt: "Page icon"
    )
    
    @PageColor(blue)
}

EmojiKit has an ``Emoji`` struct that lets you work with emojis in a structured way:

```swift
let emoji = Emoji("😀")
```

You can use ``Emoji/all`` to get a list of all available emojis from all standard ``EmojiCategory`` values:

```swift
let emojis = Emoji.all          // 😀😃😄😁😆🥹😅😂🤣🥲...
```

You can also get emojis for a specific category and version. See the <doc:EmojiCategories-Article> and <doc:EmojiVersions-Article> articles for more information.


## Unicode Information

The ``Emoji`` type has unicode-specific properties that can be used for identity and naming:

```swift
Emoji("👍").unicodeIdentifier   // \\N{THUMBS UP SIGN}
Emoji("👍🏿").unicodeIdentifier   // \\N{THUMBS UP SIGN}\\N{EMOJI MODIFIER FITZPATRICK TYPE-6}
Emoji("🚀").unicodeIdentifier   // \\N{ROCKET}
Emoji("👍").unicodeName         // Thumbs Up Sign
Emoji("👍🏿").unicodeName         // Thumbs Up Sign
Emoji("🚀").unicodeName         // Rocket
```

> Note: There are currently some gaps where certain emojis have the same identifier. This should be fixed.


## Localization

The ``Emoji`` type can be localized in any locale that has defined translations:

```swift
let swedish = Locale(identifier: "sv")

Emoji("😀").localizedName                // Grinning Face
Emoji("😀").localizedName(in: .swedish)  // Leende Ansikte
```

EmojiKit is currently only localized in `English` and `Swedish`, but anyone can contribute to provide support for more locales. See the `Sources/EmojiKit/Resources` folder for information on how to localize emojis and categories.


## Skin tones

Some ``Emoji`` values have skin tone variants:

```swift
Emoji("👍").hasSkinToneVariants     // true
Emoji("🚀").hasSkinToneVariants     // false
Emoji("👍🏿").neutralSkinToneVariant  // 👍
Emoji("👍").skinToneVariants        // 👍👍🏻👍🏼👍🏽👍🏾👍🏿
```

> Note: Skin tone support for emojis with multiple skin tone components are currently not supported, such as two persons kissing.



## Automatic Category Updates

The ``Emoji`` type has a ``Emoji/registerUserSelection()`` function that can be called whenever a user selects an emoji. This will update the ``EmojiCategory/recent`` and ``EmojiCategory/frequent`` categories accordingly.

This function is automatically called by ``EmojiGrid``, so you don't need to call the function manually when you use the grid component.

> Important: Since EmojiKit doesn't have a frequency algoritm, the ``EmojiCategory/frequent`` will currently be updated just like the ``EmojiCategory/recent`` category. You can however use the ``EmojiCategory/frequent`` category to implement your own frequency logic, or contribute with one by submitting a pull request.


## Transferable

The ``Emoji`` type conforms to `Transferable`, which means that it can use native features like drag & drop, sharing, etc.

> Important: Make sure to specify that your app supports the ``UniformTypeIdentifiers/UTType/emoji`` uniform type, to make it able to use all transferable features.

