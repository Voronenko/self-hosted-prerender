# self-hosted-prerender

Demo repository illustrating way how dynamic web sites with extensive usage of the javascript
can be indexed by search engines by using helping proxy software, called "prerender".

It can detect search engines by the host header, and serve fully rendered html page instead,
so that search engine could index rendered page contents.

## Usage

Check how prerender image is build from `prerender` folder.

Build the demo container in the root illustrating the process.

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

If you are running example without Traefik2 installed in your system, identical
direct call to running container would be

```shell
curl -H "Host: prerender.lvh.voronenko.net:80"  http://localhost:5080
```

and moment, when page is get's opened with a bot

```sh
curl -A googlebot  http://prerender.lvh.voronenko.net
<html><head></head><body>
     <p>This paragraph was rendered with script</p>
</body></html>
```

or, without traefik

```shell
curl -A googlebot -H "Host: prerender.lvh.voronenko.net:80"  http://localhost:5080
```
