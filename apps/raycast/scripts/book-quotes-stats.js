#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title [Book Quotes] Get stats
// @raycast.mode fullOutput

// Optional parameters:
// @raycast.icon 📚

// Documentation:
// @raycast.description Returns the stats of all book quotes
// @raycast.author Hemerson Carlin
// @raycast.authorURL https://mersocarlin.com

const TOKEN = '<token>'

fetch(`<service-url>`, {
  headers: {
    'Content-Type': 'application/json',
    'Bearer': TOKEN
  },
})
.then(response => response.json())
.then(json => {
  console.log()
  console.log(`📚 Book quotes stats`)
  console.table(json)
  console.log()
})
