# [notes](https://www.npmjs.com/package/notes)

notes is a fork of rake notes. I usually global install on new machines, and eventually I realize I want:

- different colors
- more colorful emoji
- more note options

So I search for `Notes.patterns = {` in the global lib and update it to use the following pattern.

Maybe someday I'll try to make this a config thing and open a PR? Maybe. 🤨

```js
Notes.patterns = {
    todo: {
    regexp: /^.*(#|\/\/|\/\*|<!--)\s*TODO\W*/,
    label: "✅ TO DO".underline.magenta
    },
    note: {
    regexp: /^.*(#|\/\/|\/\*|<!--)\s*NOTE\W*/,
    label: "📝 NOTE".underline.blue
    },
    optimize: {
    regexp: /^.*(#|\/\/|\/\*|<!--)\s*OPTIMIZE\W*/,
    label: "👾 OPTIMIZE".underline.yellow
    },
    fixme: {
    regexp: /^.*(#|\/\/|\/\*|<!--)\s*FIXME\W*/,
    label: "🛠 FIXME".underline.red
    },
    important: {
    regexp: /^.*(#|\/\/|\/\*|<!--)\s*IMPORTANT\W*/,
    label: "😳 IMPORTANT".underline.red
    },
    question: {
    regexp: /^.*(#|\/\/|\/\*|<!--)\s*!Q\W*/,
    label: "❓QUESTION".underline.black
    }
};
```
