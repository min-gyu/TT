<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="utf-8">
    <meta name="description" content="WebRTC code samples">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=1">
    <meta itemprop="description" content="Client-side WebRTC code samples">
    <meta itemprop="image" content="../../../images/webrtc-icon-192x192.png">
    <meta itemprop="name" content="WebRTC code samples">
    <meta name="mobile-web-app-capable" content="yes">
    <meta id="theme-color" name="theme-color" content="#ffffff">

    <base target="_blank">

    <title>getUserMedia: select resolution</title>

    <link rel="icon" sizes="192x192" href="/resources/resolution/images/webrtc-icon-192x192.png">
    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/resources/resolution/css/main.css">

    <style>
        body, html {
            height: 100%;
        }

        button {
            margin: 0 10px 20px 0;
            width: 90px;
        }

        div#buttons {
            margin: 0 0 1em 0;
        }

        div#container {
            max-width: 100%;
        }

        #errormessage {
            display: none;
            font-size: 300%;
        }

        #videoblock {
            display: none;
        }

        p#dimensions {
            height: 1em;
            margin: 0 0 1.5em 0;
        }

        video {
            background: none;
            height: auto;
            width: auto;
        }
    </style>

</head>

<body>
<div id="container">

    <h1><a href="//webrtc.github.io/samples/" title="WebRTC samples homepage">WebRTC samples</a> <span>getUserMedia: select resolution</span>
    </h1>
    <p></p>

    <p>This example uses <a href="https://w3c.github.io/mediacapture-main/getusermedia.html#media-track-constraints"
                            title="W3C getusermedia specification - constraints section">constraints</a>.</p>

    <p>Click a button to call <code>getUserMedia()</code> with appropriate resolution.</p>

    <div id="buttons">
        <button id="qvga">QVGA</button>
        <button id="vga">VGA</button>
        <button id="hd">HD</button>
        <button id="full-hd">Full HD</button>
        <button id="fourK">4K</button>
        <button id="eightK">8K</button>
    </div>

    <div id="videoblock">
        <p id="dimensions"></p>

        <video id="gum-res-local" playsinline autoplay></video>
        <div id="width">
            <label>Width <span></span>px:</label>
            <input type="range" min="0" max="7680" value="0">
        </div>
        <input id="sizelock" type="checkbox">Lock video size<br>
        <input id="aspectlock" type="checkbox">Lock aspect ratio<br>
    </div>
    <p id="errormessage"></p>

    <p>For more information, see <a href="http://www.html5rocks.com/en/tutorials/getusermedia/intro/"
                                    title="Media capture article by Eric Bidelman on HTML5 Rocks">Capturing Audio &amp;
        Video in HTML5</a> on HTML5 Rocks.</p>

    <a href="https://github.com/webrtc/samples/tree/gh-pages/src/content/getusermedia/resolution"
       title="View source for this page on GitHub" id="viewSource">View source on GitHub</a>
</div>

<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="/resources/resolution/js/main.js" async></script>

<script src="/resources/resolution/js/lib/ga.js"></script>

</body>
</html>