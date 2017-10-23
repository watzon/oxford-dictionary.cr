require "jq"

module Types
    class Result
        Jq.mapping({
            metadata: ResultMetadata,
            results: {Array(Word), ".results[]"},  
        })
    end
    
    class Word
        Jq.mapping({
            id: String,
            language: String,
            lexicalEntries: {Array(LexicalEntry), ".lexicalEntries[]"},
            type: String,
            word: String,
        })
    end

    class LexicalEntry
        Jq.mapping({
            entries: {Array(Entry), ".entries[]"},
            language: String,
            lexicalCategory: String,
            pronunciations: {Array(Pronunciation), ".pronunciations[]"},
            text: String,
            inflectionOf: {Array(InflectionOf), ".inflectionOf[]"},
            sentences: {Array(Sentence), ".sentences[]"},
        })
    end

    class Entry
        Jq.mapping({
            etymologies: {Array(String), ".etymologies[]"},
            grammaticalFeatures: {Array(GrammaticalFeature), ".grammaticalFeatures[]"},
            homographNumber: String,
            senses: {Array(Sense), ".senses[]"},
            variantForms: {Array(VariantForm), ".variantForms[]"},
        })
    end

    class GrammaticalFeature
        Jq.mapping({
            text: String,
            type: String,
        })
    end

    class Sense
        Jq.mapping({
            definitions: {Array(String), ".definitions[]"},
            domains: {Array(String), ".domains[]"},
            id: String,
            examples: {Array(Example), ".examples[]"},
            subsenses: {Array(Subsense), ".subsenses[]"},
            synonyms: {Array(Nym), ".synonyms[]"},
            antonyms: {Array(Nym), ".antonyms[]"},
            notes: {Array(Note), ".notes[]"},
            translations: {Array(Translation), ".translations[]"},
        })
    end

    class Subsense
        Jq.mapping({
            id: String,
            regions: {Array(String), ".regions[]"},
            registers: {Array(String), ".registers[]"},
            examples: {Array(Example), ".examples[]"},
            notes: {Array(Note), ".notes[]"},
        })
    end

    class VariantForm
        Jq.mapping({
            text: String,
        })
    end

    class Pronunciation
        Jq.mapping({
            audioFile: String,
            dialects: {Array(String), ".dialects[]"},
            phoneticNotation: String,
            phoneticSpelling: String,
        })
    end

    class InflectionOf
        Jq.mapping({
            id: String,
            text: String,
        })  
    end

    class Example
        Jq.mapping({
            text: String,
            translations: {Array(Translation), ".translations[]"},
        })
    end

    class Nym
        Jq.mapping({
            id: String,
            language: String, 
            text: String,
        })
    end

    class Note
        Jq.mapping({
            text: String,
            type: String,
        })
    end

    class Translation
        Jq.mapping({
            language: String,
            type: String,
            registers: {Array(String), ".registers[]"},
            text: String,
        })
    end

    class Sentence
        Jq.mapping({
            regions: {Array(String), ".regions[]"},
            registers: {Array(String), ".registers[]"},
            senseIds: {Array(String), ".senseIds[]"},
            text: String
        })
    end
end