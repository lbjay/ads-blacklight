require 'vendor/plugins/blacklight/app/helpers/application_helper.rb'
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def application_name
     'The Smithsonian/NASA Astrophysics Data System'
  end

  # link_to_document(doc, :label=>'VIEW', :counter => 3)
  # Use the catalog_path RESTful route to create a link to the show page for a specific item. 
  # catalog_path accepts a HashWithIndifferentAccess object. The solr query params are stored in the session,
  # so we only need the +counter+ param here.
  def link_to_abstract(doc, opts={:label=>Blacklight.config[:index][:show_link].to_sym})
    "<a class='abstract-link' href='#{ document_path(doc) }' alt='#{ doc.get('bibcode') }'>#{ doc.get opts[:label] }</a>"
  end

  def link_to_fulltext(doc, opts={:label=>Blacklight.config[:index][:show_link].to_sym, :counter => nil})
    "<a class='fulltext-link' href='#{ fulltext_path(doc) }' alt='#{ doc.get opts[:label] }'>#{ doc.get opts[:label] }</a>"
  end

  def document_path(doc)
    return "http://labs.adsabs.harvard.edu/ui/abs/#{ doc.get('bibcode') }?version=2"
  end

  def fulltext_path(doc)
    return "http://labs.adsabs.harvard.edu/ui/fulltext/#{ doc.get('bibcode') }"
  end

  # Used in the document list partial (search view) for creating a link to the document show action
  def document_fulltext_link_field
    Blacklight.config[:index][:fulltext_link].to_sym
  end

  def get_hl_snippets(doc, opts={:key => "body_syn"})
    return Array(@response['highlighting'][doc.id.to_s()][opts[:key]])
  end

  def has_snippets(doc, opts={:key => "body_syn"})
    if @response['highlighting'][doc.id.to_s()][opts[:key]]
      return true
    else
      return false
    end
  end

  def unescape_highlight(text)
    text = text.gsub('&lt;em&gt;', '<em class="search-highlight">')
    return text.gsub('&lt;/em&gt;', '</em>')
  end
  
end
