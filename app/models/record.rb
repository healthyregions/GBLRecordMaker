class Record < ApplicationRecord
    # FIELD_NAMES = {
    #     :dct_title_s => "Title"
    # }
    # def field_name(attr)
    #     FIELD_NAMES[attr.to_sym] || super
    # end

    # def dct_alternative_sm=(val)
    #     super(val == [] ? nil : val)
    # end

    validates :dct_title_s, presence: true
    validates :gbl_id, presence: true
    # validates :gbl_mdModified_dt, presence: true
    validates :gbl_mdVersion_s, presence: true
    validates :dct_accessRights_s, presence: true
    # validates :gbl_resourceClass_sm, presence: true

    def to_json
        {
            :id => gbl_id,
            :dct_title_s => dct_title_s,
            :dct_alternative_sm => dct_alternative_sm,
            :dct_description_sm => dct_description_sm ? dct_description_sm.split("|") : nil,
            :dct_language_sm => dct_language_sm ? dct_language_sm.split("|") : nil,
            :gbl_displayNote_sm => gbl_displayNote_sm ? gbl_displayNote_sm.split("|") : nil,
            # Credits,
            :dct_creator_sm => dct_creator_sm ? dct_creator_sm.split("|") : nil,
            :dct_publisher_sm => dct_publisher_sm ? dct_publisher_sm.split("|") : nil,
            :schema_provider_s => schema_provider_s ? schema_provider_s.split("|") : nil,
            # Categories,
            :gbl_resourceClass_sm => gbl_resourceClass_sm,
            :gbl_resourceType_sm => gbl_resourceType_sm ? gbl_resourceType_sm.split("|") : nil,
            :dct_subject_sm => dct_subject_sm ? dct_subject_sm.split("|") : nil,
            :dcat_theme_sm => dcat_theme_sm ? dcat_theme_sm.split("|") : nil,
            :dcat_keyword_sm => dcat_keyword_sm ? dcat_keyword_sm.split("|") : nil,
            # Temporal,
            :dct_temporal_sm => dct_temporal_sm ? dct_temporal_sm.split("|") : nil,
            :dct_issued_s => dct_issued_s,
            :gbl_indexYear_im => gbl_indexYear_im ? gbl_indexYear_im.split("|") : nil,
            :gbl_dateRange_drsim => gbl_dateRange_drsim ? gbl_dateRange_drsim.split("|") : nil,
            # Spatial,
            :dct_spatial_sm => dct_spatial_sm ? dct_spatial_sm.split("|") : nil,
            :locn_geometry => locn_geometry,
            :dcat_bbox => dcat_bbox,
            :dcat_centroid => dcat_centroid,
            :gbl_georeferenced_b => gbl_georeferenced_b,
            # Relations,
            :dct_relation_sm => dct_relation_sm ? dct_relation_sm.split("|") : nil,
            :pcdm_memberOf_sm => pcdm_memberOf_sm ? pcdm_memberOf_sm.split("|") : nil,
            :dct_isPartOf_sm => dct_isPartOf_sm ? dct_isPartOf_sm.split("|") : nil,
            :dct_source_sm => dct_source_sm ? dct_source_sm.split("|") : nil,
            :dct_isVersionOf_sm => dct_isVersionOf_sm ? dct_isVersionOf_sm.split("|") : nil,
            :dct_replaces_sm => dct_replaces_sm ? dct_replaces_sm.split("|") : nil,
            :dct_isReplacedBy_sm => dct_isReplacedBy_sm ? dct_isReplacedBy_sm.split("|") : nil,
            # Rights,
            :dct_rights_sm => dct_rights_sm ? dct_rights_sm.split("|") : nil,
            :dct_rightsHolder_sm => dct_rightsHolder_sm ? dct_rightsHolder_sm.split("|") : nil,
            :dct_license_sm => dct_license_sm ? dct_license_sm.split("|") : nil,
            :dct_accessRights_s => dct_accessRights_s,
            # Object,
            :dct_format_s => dct_format_s,
            :gbl_fileSize_s => gbl_fileSize_s,
            # Links,
            :dct_references_s => dct_references_s,
            :gbl_wxsIdentifier_s => gbl_wxsIdentifier_s,
            # Identifiers,
            :dct_identifier_sm => dct_identifier_sm ? dct_identifier_sm.split("|") : nil,
            # Admin,
            :gbl_mdModified_dt => self.updated_at,
            :gbl_mdVersion_s => gbl_mdVersion_s,
            :gbl_suppressed_b => gbl_suppressed_b,
    }.delete_if{|k,v| v == nil}.to_json
    end
end
