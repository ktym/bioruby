#
# = bio/db/kegg/pathway.rb - KEGG PATHWAY database class
#
# Copyright::  Copyright (C) 2010 Toshiaki Katayama <k@bioruby.org>
# License::    The Ruby License
#
# $Id:$
#

require 'bio/db'
require 'bio/db/kegg/common'

module Bio
class KEGG

# == Description
#
# Bio::KEGG::PATHWAY is a parser class for the KEGG PATHWAY database entry.
#
# == References
#
# * ftp://ftp.genome.jp/pub/kegg/pathway/pathway
#
class PATHWAY < KEGGDB

  DELIMITER = RS = "\n///\n"
  TAGSIZE = 12

  include Common::DblinksAsHash
  # Returns a Hash of the DB name and an Array of entry IDs in DBLINKS field.
  def dblinks_as_hash; super; end if false #dummy for RDoc
  alias dblinks dblinks_as_hash

  include Common::References
  # REFERENCE -- Returns contents of the REFERENCE records as an Array of
  # Bio::Reference objects.
  # ---
  # *Returns*:: an Array containing Bio::Reference objects
  def references; super; end if false #dummy for RDoc

  # Creates a new Bio::KEGG::PATHWAY object.
  # ---
  # *Arguments*:
  # * (required) _entry_: (String) single entry as a string
  # *Returns*:: Bio::KEGG::PAHTWAY object
  def initialize(entry)
    super(entry, TAGSIZE)
  end

  # Return the ID, described in the ENTRY line.
  # ---
  # *Returns*:: String
  def entry_id
    field_fetch('ENTRY')[/\S+/]
  end

  # Name of the pathway, described in the NAME line.
  # ---
  # *Returns*:: String
  def name
    field_fetch('NAME')
  end

  # Description of the pathway, described in the DESCRIPTION line.
  # ---
  # *Returns*:: String
  def description
    field_fetch('DESCRIPTION')
  end
  alias definition description

  # Name of the KEGG class, described in the CLASS line.
  # ---
  # *Returns*:: String
  def keggclasses
    field_fetch('CLASS')
  end

  def keggclasses_as_array
    keggclasses.split(/\s*;\s*/)
  end

  # Pathways described in the PATHWAY_MAP lines.
  # ---
  # *Returns*:: Array containing String
  def pathways_as_strings
    lines_fetch('PATHWAY_MAP')
  end

  # Pathways described in the PATHWAY_MAP lines.
  # ---
  # *Returns*:: Hash of pathway ID and its definition
  def pathways_as_hash
    unless @pathways_as_hash
      @pathways_as_hash = strings_as_hash(pathways_as_strings)
    end
    @pathways_as_hash
  end
  alias pathways pathways_as_hash

  # Modules described in the MODULE lines.
  # ---
  # *Returns*:: Array containing String
  def modules_as_strings
    lines_fetch('MODULE')
  end

  # Modules described in the MODULE lines.
  # ---
  # *Returns*:: Hash of module ID and its definition
  def modules_as_hash
    unless @modules_as_hash
      @modules_as_hash = strings_as_hash(modules_as_strings)
    end
    @modules_as_hash
  end
  alias modules modules_as_hash

  # Disease described in the DISEASE lines.
  # ---
  # *Returns*:: Array containing String
  def diseases_as_strings
    lines_fetch('DISEASE')
  end

  # Diseases described in the DISEASE lines.
  # ---
  # *Returns*:: Hash of disease ID and its definition
  def diseases_as_hash
    unless @diseases_as_hash
      @diseases_as_hash = strings_as_hash(diseases_as_strings)
    end
    @diseases_as_hash
  end
  alias diseases diseases_as_hash

  # Disease described in the DISEASE lines.
  # ---
  # *Returns*:: Array containing String
  def dblinks_as_strings
    lines_fetch('DBLINKS')
  end

  # Orthologs described in the ORTHOLOGY lines.
  # ---
  # *Returns*:: Array containing String
  def orthologs_as_strings
    lines_fetch('ORTHOLOGY')
  end

  # Orthologs described in the ORTHOLOGY lines.
  # ---
  # *Returns*:: Hash of gene ID and its definition
  def orthologs_as_hash
    unless @orthologs_as_hash
      @orthologs_as_hash = strings_as_hash(orthologs_as_strings)
    end
    @orthologs_as_hash
  end
  alias orthologs orthologs_as_hash

  # Organism described in the ORGANISM line.
  # ---
  # *Returns*:: String
  def organism
    field_fetch('ORGANISM')
  end

  # Genes described in the GENE lines.
  # ---
  # *Returns*:: Array containing String
  def genes_as_strings
    lines_fetch('GENE')
  end

  # Genes described in the GENE lines.
  # ---
  # *Returns*:: Hash of gene ID and its definition
  def genes_as_hash
    unless @genes_as_hash
      @genes_as_hash = strings_as_hash(genes_as_strings)
    end
    @genes_as_hash
  end
  alias genes genes_as_hash

  # Enzymes described in the ENZYME lines.
  # ---
  # *Returns*:: Array containing String
  def enzymes_as_strings
    lines_fetch('ENZYME')
  end

  # Enzymes described in the ENZYME lines.
  # ---
  # *Returns*:: Hash of enzyme ID and its definition
  def enzymes_as_hash
    unless @enzymes_as_hash
      @enzymes_as_hash = strings_as_hash(enzymes_as_strings)
    end
    @enzymes_as_hash
  end
  alias enzymes enzymes_as_hash

  # Reactions described in the REACTION lines.
  # ---
  # *Returns*:: Array containing String
  def reactions_as_strings
    lines_fetch('REACTION')
  end

  # Reactions described in the REACTION lines.
  # ---
  # *Returns*:: Hash of reaction ID and its definition
  def reactions_as_hash
    unless @reactions_as_hash
      @reactions_as_hash = strings_as_hash(reactions_as_strings)
    end
    @reactions_as_hash
  end
  alias reactions reactions_as_hash

  # Compounds described in the COMPOUND lines.
  # ---
  # *Returns*:: Array containing String
  def compounds_as_strings
    lines_fetch('COMPOUND')
  end

  # Compounds described in the COMPOUND lines.
  # ---
  # *Returns*:: Hash of compound ID and its definition
  def compounds_as_hash
    unless @compounds_as_hash
      @compounds_as_hash = strings_as_hash(compounds_as_strings)
    end
    @compounds_as_hash
  end
  alias compounds compounds_as_hash

  # Pathways described in the REL_PATHWAY lines.
  # ---
  # *Returns*:: Array containing String
  def relpathways_as_strings
    lines_fetch('REL_PATHWAY')
  end

  # Related pathways described in the REL_PATHWAY lines.
  # ---
  # *Returns*:: Hash of pathway ID and its definition
  def relpathways_as_hash
    unless @relpathways_as_hash
      @relpathways_as_hash = strings_as_hash(relpathways_as_strings)
    end
    @relpathways_as_hash
  end
  alias relpathways relpathways_as_hash

  # KO pathway described in the KO_PATHWAY line.
  # ---
  # *Returns*:: String
  def kopathway
    field_fetch('KO_PATHWAY')
  end

  def strings_as_hash(lines)
    hash = {}
    lines.each do |line|
      entry_id, definition = line.split(/\s+/, 2)
      hash[entry_id] = definition
    end
    return hash
  end

end # MODULE

end # KEGG
end # Bio
