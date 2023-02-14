public class JSON2Apex {

    public String word;
    public String phonetic;
    public List<Phonetics> phonetics;

    public class Phonetics {
        public String text;
        public String audio;
    }

    public String origin;
    public List<Meanings> meanings;

    public class Meanings {
        public String partOfSpeech;
        public List<Definition> definitions;
    }

    public class Definition {
        public String definition;
        public String example;
        public List<String> synonyms;
        public List<String> antonyms;
    }
  
}