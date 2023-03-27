class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
    respond_to do |format|
      format.html
      format.json{
        render :json => @record.to_json
      }
    end
  end

  def new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    record = Record.new(record_params)
    record.save
    redirect_to root_path
  end
  
  def update
    record = Record.find(params[:id])
    record.update(record_params)
    redirect_to root_path
  end

  def delete
    record = Record.find(params[:id])
    record.destroy
    redirect_to root_path
  end

  private
  
  def record_params
    params.require(:record)
      .permit(
        :dct_title_s,
        :dct_alternative_sm,
        :dct_description_sm,
        :dct_language_sm,
        :gbl_displayNote_sm,
        # Credits,
        :dct_creator_sm,
        :dct_publisher_sm,
        :schema_provider_s,
        # Categories,
        :gbl_resourceClass_sm,
        :gbl_resourceType_sm,
        :dct_subject_sm,
        :dcat_theme_sm,
        :dcat_keyword_sm,
        # Temporal,
        :dct_temporal_sm,
        :dct_issued_s,
        :gbl_indexYear_im,
        :gbl_dateRange_drsim,
        # Spatial,
        :dct_spatial_sm,
        :locn_geometry,
        :dcat_bbox,
        :dcat_centroid,
        :gbl_georeferenced_b,
        # Relations,
        :dct_relation_sm,
        :pcdm_memberOf_sm,
        :dct_isPartOf_sm,
        :dct_source_sm,
        :dct_isVersionOf_sm,
        :dct_replaces_sm,
        :dct_isReplacedBy_sm,
        # Rights,
        :dct_rights_sm,
        :dct_rightsHolder_sm,
        :dct_license_sm,
        :dct_accessRights_s,
        # Object,
        :dct_format_s,
        :gbl_fileSize_s,
        # Links,
        :dct_references_s,
        :gbl_wxsIdentifier_s,
        # Identifiers,
        :gbl_id,
        :dct_identifier_sm,
        # Admin,
        :gbl_mdModified_dt,
        :gbl_mdVersion_s,
        :gbl_suppressed_b,
      )
      # .reject {|k, v| v == "[]" }
      .transform_values {|v| v == "" ? nil : v}
      .transform_values {|v| v == "[]" ? nil : v}
      # .transform_values {|v| v.class == Array ? v.join("|") : v }
      # .reject{ |k, v| v == ""}
  end
end
