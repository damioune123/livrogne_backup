# -*-coding:utf-8 -*
import unicodedata

def strip_accents(text):
        text = unicode(text,"utf-8" )
        return ''.join(c for c in unicodedata.normalize('NFKD', text) if unicodedata.category(c) != 'Mn')
print(strip_accents("jérazdqsilèrmI"))
