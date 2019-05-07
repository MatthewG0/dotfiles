#!/usr/bin/env node

// const fs = require('fs');
// const gitlogFile = JSON.parse(fs.readFileSync(0, 'utf8')); // stdin
// const gitlog = gitlogFile.log;
// const result = gitlog.map(({ commit, author, date, files }) => files.map(file => `"${commit}", "${author}", "${date}", "${file}"`).join('\n')).join('\n');
// process.stdout.write('"Commit", "Author", "Date", "File"\n' + result);
// fs.writeFileSync(1, '"Commit", "Author", "Date", "File"\n' + result); // stdout


process.stdout.write('"Commit", "Author", "Date", "File"\n' + JSON.parse(require('fs').readFileSync(0, 'utf8')).log.map(({ commit, author, date, files }) => files.map(file => `"${commit}", "${author}", "${date}", "${file}"`).join('\n')).join('\n'));


// Do it all
// git log --since="2018-06-01" --name-only --no-merges --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:']}, {%n "commit": "%H",%n "author": "%aE",%n "date": "%ad", %n "message": "%f", %n "files": [' | perl -pe 's/(.*\w)$/"\1",/' | tail -c +4 | cat <(echo {\"log\": [) - <(echo ]} ]}) | perl -0777 -pe 's/,(\s*[^\s\[{"])/\1/g' | node -e "process.stdout.write('\"Commit\", \"Author\", \"Date\", \"File\"\n' + JSON.parse(require('fs').readFileSync(0, 'utf8')).log.map(({ commit, author, date, files }) => files.map(file => \`\"\${commit}\", \"\${author}\", \"\${date}\", \"\${file}\"\`).join('\n')).join('\n'));" > ~/temp/log.csv