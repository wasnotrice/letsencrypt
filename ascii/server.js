const process = require('process')
const express = require('express')
const app = express()

const asciicastTemplate = (name) => {
  let title = name.split('-').join(' ')
  let lines = [
    '<html>',
    '<head>',
      `<title>${title}</title>`,
      '<meta charset="utf-8">',
      '<link rel="stylesheet" type="text/css" href="/vendor/asciinema-player.css" />',
    '</head>',
    '<body>',
      `<asciinema-player src="/media/${name}.json" autoplay="true"></asciinema-player>`,
      '<script src="/vendor/asciinema-player.js"></script>',
    '</body>',
    '</html>',
  ]

  return lines.join('\n')
}

app.get('/ascii/:name', (req, res) => {
  let html = asciicastTemplate(req.params.name)
  res.send(html)
})

app.use(express.static('static'))

const port = process.env.PORT || 3939
app.listen(port, () => {
  console.log(`Server started on port ${port}`)
})
