#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title [Book Quotes] Get book quote
// @raycast.mode fullOutput

// Optional parameters:
// @raycast.icon 📚

// Documentation:
// @raycast.description Returns a quote from past books I've read
// @raycast.author Hemerson Carlin
// @raycast.authorURL https://mersocarlin.com

const TOKEN = '<token>'

fetch(`<service-url>`, {
  headers: {
    'Content-Type': 'application/json',
    'Bearer': TOKEN
  },
  method: 'PUT'
})
.then(response => response.json())
.then(json => {
  console.log()
  console.log(`📚 ${json.book.title} by ${json.book.author}`)
  console.log(`📒 ${json.quote}`)
  console.log()
})
