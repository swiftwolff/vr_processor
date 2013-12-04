import urllib2
import json
f = open("output.flac")
text = f.read()
f.close()
print "Sending it to Google..."
req = urllib2.Request('https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=en-US', data=text, headers={'Content-type': 'audio/x-flac; rate=44100'})
ret = urllib2.urlopen(req)
text = json.loads(ret.read())['hypotheses'][0]['utterance']
print text