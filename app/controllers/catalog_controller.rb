require_dependency 'vendor/plugins/blacklight/app/controllers/catalog_controller.rb'

class CatalogController < ApplicationController 
    def solr_search_params(extra_controller_params={})
        solr_parameters = super extra_controller_params
        if solr_parameters.key? :q
            solr_parameters[:q].gsub!(/\S+/) { |match| 
                if match.include? ':' or match.index('=') != 0
                    match
                else
                    match.sub("=", "#{Blacklight.config[:nosyn_field]}:")
                end 
            }
        end
        return solr_parameters
    end
end
