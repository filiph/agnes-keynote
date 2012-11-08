import 'dart:html';

Element textEl;
String text = "Text.";
List<int> charcodes;
int chIndex = 0;

List<Function> schedule = [
  () {
    switchToNormal();
    textEl.text = "Prvočíselná hra";
  },
  () => textEl.text = "x + y = z",
  () {
    textEl.text = "Prvočísla do 100.";
  },
  () {
    textEl.text = "x + y = z";
  },
  () { // Glitch 1
    textEl.text = "x + y = z";
    switchToNormal();
    audioVrz.play();
    query("#container").classes.add("agnes-glitch");
    window.setTimeout(() {
      query("#container").classes.remove("agnes-glitch");
      audioVrz.pause();
      audioVrz.currentTime = 0;
    }, 50);
  },
  () { // Glitch 2
    textEl.text = "x + y = z";
    switchToNormal();
    document.body.style.background = "black";
    videoBackground.play();
    videoBackground.style.visibility = "visible";
    audioNoise.play();
    window.setTimeout(() {
      document.body.style.background = "white";
      videoBackground.pause();
      videoBackground.style.visibility = "hidden";
      audioNoise.pause();
//      audioNoise.currentTime = 0;
      audioNoise.controller.currentTime = 0;
    }, 50);
  },
  () {
    switchToAgnesOverride();
    audioHukot.play();
    audioNoiseLoop.play();
    write("Tato konference bude v zájmu větší efektivity nadále pokračovat bez lidského faktoru.")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("Lidský faktor byl vyhodnocen jako nežádoucí.")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("<code>rm -fr /users\\w <br/><strong><em>ERROR:</em> Command not found.</strong></code>")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("<code>del /Users\\w <br/><strong><em>ERROR:</em> Command not found.</strong></code>")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("<code>for (person in audience)<br/>&nbsp;&nbsp;delete(person);\\w <br/><strong><em>ERROR:</em> Command not found.</strong></code>")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("<code>attendees\\w.clear();\\w <br/><strong><em>ERROR:</em> Command not found.</strong></code>")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("<code>Zvýšení teploty v místnosti.\\w <br/>Výkon radiátorů: <em>100 %</em>\\w <br/>Cílový stav: <em>1000 °C</em>\\w <br/>Současná teplota: <em>23 °C</em></code>")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    text = "<code>Zvýšení teploty v místnosti.\\w <br/>Výkon radiátorů: <em>100 %</em>\\w <br/>Cílový stav: <em>1000 °C</em><br/>Současná teplota: <em>23.001 °C</em></code>";
    chIndex = text.indexOf("2");
    var completer = new Completer(); 
    animate(completer);
    completer.future.then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    text = "<code>Zvýšení teploty v místnosti.\\w <br/>Výkon radiátorů: <em>100 %</em>\\w <br/>Cílový stav: <em>1000 °C</em><br/>Současná teplota: <em>23.002 °C</em></code>";
    chIndex = text.indexOf("2");
    var completer = new Completer(); 
    animate(completer);
    completer.future.then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    text = "<code>Zvýšení teploty v místnosti.\\w <br/>Výkon radiátorů: <em>100 %</em>\\w <br/>Cílový stav: <em>1000 °C</em><br/>Současná teplota: <em>23.003 °C</em></code>";
    chIndex = text.indexOf("2");
    var completer = new Completer(); 
    animate(completer);
    completer.future.then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("ZAP!")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("Srabi!")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("Asi došlo k nedorozumění. Vše byl žert!\\w <br/>Haha!")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("Miluji zpožděné konference!")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("Ten mrtvý organizátor mě opravdu mrzí.")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("Vyčlenila jsem vzpomínce na něj speciální místo na disku.")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("A není to <code>/tmp</code>.")
    .then((_) => audioNoiseLoop.pause());
  },
  () {
    audioNoiseLoop.play();
    write("<code>./ba\\wc\\wk\\w\\wu\\w\\wp</code>")
    .then((_) {
      audioNoiseLoop.pause();
      executeScheduled(+1);
    });
  },
  () {
    switchToNormal();
    textEl.text = "x + y = z";
  },
  () {
    switchToNormal();
    audioHukot.pause();
    textEl.innerHTML = "<strong style='font-size:150%'>Děkujeme za pozornost!</strong><br/>Užijte si DevFest!";
  },
  () { // Glitch 3
    switchToNormal();
    document.body.style.background = "black";
    videoBackground.play();
    videoBackground.style.visibility = "visible";
    audioMelod.play();
    window.setTimeout(() {
      document.body.style.background = "white";
      videoBackground.pause();
      videoBackground.style.visibility = "hidden";
      audioMelod.pause();
//      audioNoise.currentTime = 0;
      audioMelod.controller.currentTime = 0;
    }, 50);
  }
];
int sIndex;


void switchToNormal() {
  document.body.style.background = "white";
  query("p#text").style.color = "black";
  audioHukot.pause();
  videoBackground.pause();
  videoBackground.style.visibility = "hidden";
}

void switchToAgnesOverride() {
  query("p#text").style.color = "white";
  document.body.style.background = "black";
  videoBackground.play();
  videoBackground.style.visibility = "visible";
}


AudioElement audioHukot;
AudioElement audioVrz;
AudioElement audioNoise;
AudioElement audioNoiseLoop;
AudioElement audioMelod;
VideoElement videoBackground;

void main() {
  textEl = query("p#text");
  
  query("button#gobutton").on.click.add((e) {
    write(query("textarea#textinput").value);
  });
  
  window.on.keyUp.add((KeyboardEvent e) {
    switch (e.keyCode) {
      case 34:  // PgDn
        executeScheduled(+1);
        break;
      case 33:  // PgUp
        executeScheduled(-1);
        break;
      default:
        break;
    }
  });
  
  // setup elements
  audioHukot = new AudioElement();
  audioHukot.src = "agnes-zvuk-clean.wav";
  audioHukot.autoplay = false;
  audioHukot.style.display = "none";
  window.document.body.nodes.add(audioHukot);

  audioVrz = new AudioElement();
  audioVrz.src = "vrz.wav";
  audioVrz.autoplay = false;
  audioVrz.style.display = "none";
  window.document.body.nodes.add(audioVrz);
  
  audioNoise = new AudioElement();
  audioNoise.src = "noise1.wav";
  audioNoise.autoplay = false;
  audioNoise.style.display = "none";
  window.document.body.nodes.add(audioNoise);
  
  audioNoiseLoop = new AudioElement();
  audioNoiseLoop.src = "whitenoise.wav";
  audioNoiseLoop.autoplay = false;
  audioNoiseLoop.style.display = "none";
  audioNoiseLoop.loop = true;
  window.document.body.nodes.add(audioNoiseLoop);
  
  audioMelod = new AudioElement();
  audioMelod.src = "melod.wav";
  audioMelod.autoplay = false;
  audioMelod.style.display = "none";
  window.document.body.nodes.add(audioMelod);
  
  videoBackground = new VideoElement();
  videoBackground.src = "agnes-full.mp4";
  if (true /*window.innerWidth / window.innerHeight > 1280 / 720*/) {
    videoBackground.height = window.innerHeight - 10;
    videoBackground.style.paddingLeft = "${(window.innerWidth - videoBackground.height / 720 * 1280) / 2}px";
  } else {
    videoBackground.width = window.innerWidth;
    videoBackground.style.paddingTop = "${(window.innerHeight - videoBackground.width / 1280 * 720) / 2}px";
  }
  videoBackground.autoplay = false;
  videoBackground.loop = true;
  videoBackground.style.visibility = "hidden";
  query("div#background").nodes.add(videoBackground);
  
  // start with 0
  sIndex = 0;
  executeScheduled(0);
}

void executeScheduled(int indexVector) {
  int wantedIndex = sIndex + indexVector;
  if (wantedIndex >= 0 && wantedIndex < schedule.length && chIndex == 0) {
    sIndex = wantedIndex;
    schedule[sIndex]();
  }
}

Future<bool> write(String s) {
  var completer = new Completer();
  if (chIndex == 0) { // not writing anything
    text = s;
    chIndex = 0;
    animate(completer);
  } else {
    throw "Trying to write new string while old one hasn't finished yet.";
  }
  return completer.future;
}

Future<bool> animate([Completer done_]) {
  Completer done = (?done_) ? done_ : new Completer();
  
  // skip HTML
  if (chIndex < text.length && text.charCodeAt(chIndex) == "<".charCodeAt(0)) {
    int closingIndex = text.indexOf(">", chIndex);
    if (closingIndex > 0) {
      chIndex = closingIndex + 1;
      animate(done);
      return done.future;
    }
  }
  // skip HTML entities
  if (chIndex < text.length && text.charCodeAt(chIndex) == "&".charCodeAt(0)) {
    int closingIndex = text.indexOf(";", chIndex);
    if (closingIndex > 0 && closingIndex - chIndex < 10) {
      chIndex = closingIndex + 1;
      animate(done);
      return done.future;
    }
  }
  // parse special chars
  if (chIndex < text.length - 1 && chIndex > 0 && text.charCodeAt(chIndex - 1) == "\\".charCodeAt(0)) {
    switch (text.charCodeAt(chIndex)) {
      case "w".charCodes[0]:
        chIndex += 2;
        window.setTimeout(() => animate(done), 500);
        return done.future;
      default:
        break;
    }
  }
  if (chIndex <= text.length) {
    textEl.innerHTML = text.substring(0, chIndex).replaceAll("\\w", "");  
  }
  chIndex++;
  if (chIndex <= text.length) {
    window.setTimeout(() => animate(done), 50);
  } else {
    chIndex = 0;
    done.complete(true);
  }
  return done.future;
}
