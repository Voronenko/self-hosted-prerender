## Usage

Compare output of usual page open

```sh
curl  http://prerender.lvh.voronenko.net
<html>
  <body>
     <script type="text/javascript">
         document.write('<p>This paragraph was rendered with script</p>');
     </script>
  </body>
</html>
```

and moment, when page is get's opened with a bot

```sh
curl -A googlebot  http://prerender.lvh.voronenko.net
<html><head></head><body>
     <p>This paragraph was rendered with script</p>
</body></html>
```
