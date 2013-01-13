# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120319031712) do

  create_table "adds", :force => true do |t|
    t.string   "name"
    t.integer  "picture_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_resource", :primary_key => "resourceId", :force => true do |t|
    t.string "resourceName", :limit => 128, :null => false
  end

  create_table "app_role", :primary_key => "roleId", :force => true do |t|
    t.string  "roleName", :limit => 128,  :null => false
    t.string  "roleDesc", :limit => 128
    t.integer "status",   :limit => 2,    :null => false
    t.string  "rights",   :limit => 2000
  end

  create_table "app_user", :primary_key => "userId", :force => true do |t|
    t.string   "username",      :limit => 128,                :null => false
    t.string   "password",      :limit => 128,                :null => false
    t.string   "email",         :limit => 128,                :null => false
    t.integer  "depId",         :limit => 8,                  :null => false
    t.string   "position",      :limit => 32
    t.string   "phone",         :limit => 32
    t.string   "mobile",        :limit => 32
    t.string   "fax",           :limit => 32
    t.string   "address",       :limit => 64
    t.string   "zip",           :limit => 32
    t.string   "photo",         :limit => 128
    t.datetime "accessionTime",                               :null => false
    t.integer  "status",        :limit => 2,                  :null => false
    t.string   "education",     :limit => 64
    t.string   "fullname",      :limit => 128
    t.integer  "title",         :limit => 2,   :default => 1, :null => false
  end

  add_index "app_user", ["username"], :name => "username", :unique => true

  create_table "appointment", :primary_key => "appointId", :force => true do |t|
    t.integer  "userId",       :limit => 8
    t.string   "subject",      :limit => 128,  :null => false
    t.datetime "startTime",                    :null => false
    t.datetime "endTime",                      :null => false
    t.string   "content",      :limit => 5000, :null => false
    t.string   "notes",        :limit => 1000
    t.string   "location",     :limit => 150,  :null => false
    t.string   "inviteEmails", :limit => 1000
  end

  add_index "appointment", ["userId"], :name => "FK_AP_R_AU"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "context"
    t.integer  "user_id"
    t.integer  "read_num"
    t.integer  "modi_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_forum_id"
    t.integer  "picture_id"
    t.integer  "forum_id"
    t.string   "author"
  end

  create_table "assets_type", :primary_key => "assetsTypeId", :force => true do |t|
    t.string "typeName", :limit => 128, :null => false
  end

  create_table "book", :primary_key => "bookId", :force => true do |t|
    t.integer "typeId",     :limit => 8
    t.string  "bookName",   :limit => 128,                                :null => false
    t.string  "author",     :limit => 128,                                :null => false
    t.string  "isbn",       :limit => 64,                                 :null => false
    t.string  "publisher",  :limit => 128
    t.decimal "price",                     :precision => 10, :scale => 0, :null => false
    t.string  "location",   :limit => 128,                                :null => false
    t.string  "department", :limit => 64,                                 :null => false
    t.integer "amount",                                                   :null => false
  end

  add_index "book", ["typeId"], :name => "FK_BK_R_BT"

  create_table "book_bor_ret", :primary_key => "recordId", :force => true do |t|
    t.integer  "bookSnId",       :limit => 8
    t.datetime "borrowTime",                    :null => false
    t.datetime "returnTime",                    :null => false
    t.datetime "lastReturnTime"
    t.string   "borrowIsbn",     :limit => 128, :null => false
    t.string   "bookName",       :limit => 128, :null => false
  end

  add_index "book_bor_ret", ["bookSnId"], :name => "FK_BBR_R_BS"

  create_table "book_sn", :primary_key => "bookSnId", :force => true do |t|
    t.integer "bookId", :limit => 8,   :null => false
    t.string  "bookSN", :limit => 128, :null => false
    t.integer "status", :limit => 2,   :null => false
  end

  add_index "book_sn", ["bookId"], :name => "FK_BS_R_BK"

  create_table "book_type", :primary_key => "typeId", :force => true do |t|
    t.string "typeName", :limit => 128, :null => false
  end

  create_table "calendar_plan", :primary_key => "planId", :force => true do |t|
    t.datetime "startTime"
    t.datetime "endTime"
    t.integer  "urgent",       :limit => 2,    :null => false
    t.string   "content",      :limit => 1200, :null => false
    t.integer  "status",       :limit => 2,    :null => false
    t.integer  "userId",       :limit => 8,    :null => false
    t.string   "fullname",     :limit => 32
    t.integer  "assignerId",   :limit => 8,    :null => false
    t.string   "assignerName", :limit => 32
    t.string   "feedback",     :limit => 500
    t.integer  "showStyle",    :limit => 2,    :null => false
    t.integer  "taskType",     :limit => 2,    :null => false
  end

  add_index "calendar_plan", ["assignerId"], :name => "FK_CP_R_AUAS"
  add_index "calendar_plan", ["userId"], :name => "FK_CA_R_AU"

  create_table "car", :primary_key => "carId", :force => true do |t|
    t.string   "carNo",         :limit => 128, :null => false
    t.string   "carType",       :limit => 64,  :null => false
    t.string   "engineNo",      :limit => 128
    t.datetime "buyInsureTime"
    t.datetime "auditTime"
    t.string   "notes",         :limit => 500
    t.string   "factoryModel",  :limit => 64,  :null => false
    t.string   "driver",        :limit => 32,  :null => false
    t.date     "buyDate",                      :null => false
    t.integer  "status",        :limit => 2,   :null => false
    t.string   "cartImage",     :limit => 128
  end

  create_table "car_apply", :primary_key => "applyId", :force => true do |t|
    t.integer  "carId",          :limit => 8,                                  :null => false
    t.string   "department",     :limit => 64,                                 :null => false
    t.string   "userFullname",   :limit => 32,                                 :null => false
    t.date     "applyDate",                                                    :null => false
    t.string   "reason",         :limit => 512,                                :null => false
    t.datetime "startTime",                                                    :null => false
    t.datetime "endTime"
    t.string   "proposer",       :limit => 32,                                 :null => false
    t.decimal  "mileage",                       :precision => 18, :scale => 2
    t.decimal  "oilUse",                        :precision => 18, :scale => 2
    t.string   "notes",          :limit => 128
    t.integer  "approvalStatus", :limit => 2,                                  :null => false
  end

  add_index "car_apply", ["carId"], :name => "FK_CRA_R_CR"

  create_table "cart_repair", :primary_key => "repairId", :force => true do |t|
    t.integer  "carId",      :limit => 8
    t.datetime "repairDate",                                               :null => false
    t.string   "reason",     :limit => 128,                                :null => false
    t.string   "executant",  :limit => 128,                                :null => false
    t.string   "notes",      :limit => 128
    t.string   "repairType", :limit => 128,                                :null => false
    t.decimal  "fee",                       :precision => 18, :scale => 2
  end

  add_index "cart_repair", ["carId"], :name => "FK_CRR_R_CR"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_fingerprint"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "company", :primary_key => "companyId", :force => true do |t|
    t.string   "companyNo",   :limit => 128
    t.string   "companyName", :limit => 128,  :null => false
    t.string   "companyDesc", :limit => 5000
    t.string   "legalPerson", :limit => 32
    t.datetime "setup"
    t.string   "phone",       :limit => 32
    t.string   "fax",         :limit => 32
    t.string   "site",        :limit => 128
    t.string   "logo",        :limit => 128
  end

  create_table "contract", :primary_key => "contractId", :force => true do |t|
    t.string   "contractNo",     :limit => 64,                                  :null => false
    t.string   "subject",        :limit => 128,                                 :null => false
    t.decimal  "contractAmount",                 :precision => 10, :scale => 0, :null => false
    t.string   "mainItem",       :limit => 4000
    t.string   "salesAfterItem", :limit => 4000
    t.datetime "validDate",                                                     :null => false
    t.datetime "expireDate",                                                    :null => false
    t.string   "serviceDep",     :limit => 64
    t.string   "serviceMan",     :limit => 64
    t.string   "signupUser",     :limit => 64,                                  :null => false
    t.datetime "signupTime",                                                    :null => false
    t.string   "creator",        :limit => 32,                                  :null => false
    t.datetime "createtime",                                                    :null => false
    t.integer  "projectId",      :limit => 8
    t.string   "consignAddress", :limit => 128
    t.string   "consignee",      :limit => 32
  end

  add_index "contract", ["projectId"], :name => "FK_CT_R_PT"

  create_table "contract_config", :primary_key => "configId", :force => true do |t|
    t.string  "itemName",   :limit => 128,                                :null => false
    t.integer "contractId", :limit => 8
    t.string  "itemSpec",   :limit => 128,                                :null => false
    t.decimal "amount",                    :precision => 18, :scale => 2, :null => false
    t.string  "notes",      :limit => 200
  end

  add_index "contract_config", ["contractId"], :name => "FK_CC_R_CT"

  create_table "contract_file", :id => false, :force => true do |t|
    t.integer "fileId",     :limit => 8, :null => false
    t.integer "contractId", :limit => 8, :null => false
  end

  add_index "contract_file", ["contractId"], :name => "FK_CTF_R_CT"

  create_table "cus_connection", :primary_key => "connId", :force => true do |t|
    t.integer  "customerId", :limit => 8,    :null => false
    t.string   "contactor",  :limit => 32,   :null => false
    t.datetime "startDate",                  :null => false
    t.datetime "endDate",                    :null => false
    t.string   "content",    :limit => 512,  :null => false
    t.string   "notes",      :limit => 1000
    t.string   "creator",    :limit => 32
  end

  add_index "cus_connection", ["customerId"], :name => "FK_CC_R_CS"

  create_table "cus_linkman", :primary_key => "linkmanId", :force => true do |t|
    t.integer "customerId",  :limit => 8,   :null => false
    t.string  "fullname",    :limit => 32,  :null => false
    t.integer "sex",         :limit => 2,   :null => false
    t.string  "position",    :limit => 32
    t.string  "phone",       :limit => 32
    t.string  "mobile",      :limit => 32,  :null => false
    t.string  "email",       :limit => 100
    t.string  "msn",         :limit => 100
    t.string  "qq",          :limit => 64
    t.date    "birthday"
    t.string  "homeAddress", :limit => 128
    t.string  "homeZip",     :limit => 32
    t.string  "homePhone",   :limit => 32
    t.string  "hobby",       :limit => 100
    t.integer "isPrimary",   :limit => 2,   :null => false
    t.string  "notes",       :limit => 500
    t.string  "fax",         :limit => 32
  end

  add_index "cus_linkman", ["customerId"], :name => "FK_CLM_R_CS"

  create_table "customer", :primary_key => "customerId", :force => true do |t|
    t.string  "customerNo",      :limit => 64,                                 :null => false
    t.string  "industryType",    :limit => 64,                                 :null => false
    t.string  "customerSource",  :limit => 64
    t.integer "customerType",    :limit => 2,                                  :null => false
    t.integer "companyScale"
    t.string  "customerName",    :limit => 128,                                :null => false
    t.string  "customerManager", :limit => 32,                                 :null => false
    t.string  "phone",           :limit => 32,                                 :null => false
    t.string  "fax",             :limit => 32
    t.string  "site",            :limit => 128
    t.string  "email",           :limit => 128
    t.string  "state",           :limit => 32
    t.string  "city",            :limit => 32
    t.string  "zip",             :limit => 32
    t.string  "address",         :limit => 100
    t.decimal "registerFun",                    :precision => 10, :scale => 0
    t.decimal "turnOver",                       :precision => 10, :scale => 0
    t.string  "currencyUnit",    :limit => 32
    t.string  "otherDesc",       :limit => 800
    t.string  "principal",       :limit => 32
    t.string  "openBank",        :limit => 64
    t.string  "accountsNo",      :limit => 64
    t.string  "taxNo",           :limit => 64
    t.string  "notes",           :limit => 500
    t.integer "rights",          :limit => 2,                                  :null => false
  end

  create_table "department", :primary_key => "depId", :force => true do |t|
    t.string  "depName",  :limit => 128, :null => false
    t.string  "depDesc",  :limit => 256
    t.integer "depLevel",                :null => false
    t.integer "parentId", :limit => 8
    t.string  "path",     :limit => 128
  end

  create_table "depre_record", :primary_key => "recordId", :force => true do |t|
    t.integer  "assetsId",     :limit => 8,                                :null => false
    t.decimal  "workCapacity",              :precision => 18, :scale => 2
    t.decimal  "depreAmount",               :precision => 18, :scale => 4, :null => false
    t.datetime "calTime",                                                  :null => false
  end

  add_index "depre_record", ["assetsId"], :name => "FK_DR_R_FA"

  create_table "depre_type", :primary_key => "depreTypeId", :force => true do |t|
    t.string  "typeName",    :limit => 64,                                 :null => false
    t.decimal "depreRate",                  :precision => 18, :scale => 2, :null => false
    t.decimal "deprePeriod",                :precision => 18, :scale => 2, :null => false
    t.string  "typeDesc",    :limit => 500
    t.integer "calMethod",   :limit => 2,                                  :null => false
  end

  create_table "diary", :primary_key => "diaryId", :force => true do |t|
    t.integer "userId",    :limit => 8
    t.date    "dayTime",                :null => false
    t.text    "content",                :null => false
    t.integer "diaryType", :limit => 2, :null => false
  end

  add_index "diary", ["userId"], :name => "FK_DY_R_AU"

  create_table "doc_file", :id => false, :force => true do |t|
    t.integer "fileId", :limit => 8, :null => false
    t.integer "docId",  :limit => 8, :null => false
  end

  add_index "doc_file", ["docId"], :name => "FK_DF_F_DT"

  create_table "doc_folder", :primary_key => "folderId", :force => true do |t|
    t.integer "userId",     :limit => 8
    t.string  "folderName", :limit => 128, :null => false
    t.integer "parentId",   :limit => 8
    t.string  "path",       :limit => 128
    t.integer "isShared",   :limit => 2,   :null => false
  end

  create_table "doc_privilege", :primary_key => "privilegeId", :force => true do |t|
    t.integer "folderId", :limit => 8
    t.integer "docId",    :limit => 8
    t.integer "rights",                  :null => false
    t.integer "udrId"
    t.string  "udrName",  :limit => 128
    t.integer "flag",     :limit => 2,   :null => false
    t.integer "fdFlag",   :limit => 2,   :null => false
  end

  add_index "doc_privilege", ["docId"], :name => "FK_DP_R_DT"
  add_index "doc_privilege", ["folderId"], :name => "FK_DP_R_DF"

  create_table "document", :primary_key => "docId", :force => true do |t|
    t.string   "docName",         :limit => 100,  :null => false
    t.text     "content"
    t.datetime "createtime",                      :null => false
    t.datetime "updatetime"
    t.integer  "folderId",        :limit => 8
    t.integer  "userId",          :limit => 8
    t.integer  "haveAttach",      :limit => 2
    t.string   "sharedUserIds",   :limit => 1000
    t.string   "sharedUserNames", :limit => 1000
    t.string   "sharedDepIds",    :limit => 1000
    t.string   "sharedDepNames",  :limit => 1000
    t.string   "sharedRoleIds",   :limit => 1000
    t.string   "sharedRoleNames", :limit => 1000
    t.integer  "isShared",        :limit => 2,    :null => false
  end

  add_index "document", ["folderId"], :name => "FK_DT_R_DF"
  add_index "document", ["userId"], :name => "FK_DT_R_AU"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_attach", :primary_key => "fileId", :force => true do |t|
    t.string   "fileName",   :limit => 128,  :null => false
    t.string   "filePath",   :limit => 128,  :null => false
    t.datetime "createtime",                 :null => false
    t.string   "ext",        :limit => 32
    t.string   "fileType",   :limit => 32
    t.string   "note",       :limit => 1024
    t.string   "creator",    :limit => 32,   :null => false
  end

  create_table "fixed_assets", :primary_key => "assetsId", :force => true do |t|
    t.string   "assetsNo",        :limit => 128
    t.string   "assetsName",      :limit => 128,                                :null => false
    t.string   "model",           :limit => 64
    t.integer  "assetsTypeId",    :limit => 8,                                  :null => false
    t.string   "manufacturer",    :limit => 64
    t.datetime "manuDate"
    t.datetime "buyDate",                                                       :null => false
    t.string   "beDep",           :limit => 64,                                 :null => false
    t.string   "custodian",       :limit => 32
    t.string   "notes",           :limit => 500
    t.decimal  "remainValRate",                  :precision => 18, :scale => 6, :null => false
    t.integer  "depreTypeId",     :limit => 8,                                  :null => false
    t.datetime "startDepre"
    t.decimal  "intendTerm",                     :precision => 18, :scale => 2
    t.decimal  "intendWorkGross",                :precision => 18, :scale => 2
    t.string   "workGrossUnit",   :limit => 128
    t.decimal  "assetValue",                     :precision => 18, :scale => 4, :null => false
    t.decimal  "assetCurValue",                  :precision => 18, :scale => 4, :null => false
  end

  add_index "fixed_assets", ["assetsTypeId"], :name => "FK_FA_R_AT"
  add_index "fixed_assets", ["depreTypeId"], :name => "FK_FA_R_DT"

  create_table "form_data", :primary_key => "dataId", :force => true do |t|
    t.integer  "formId",     :limit => 8,                                   :null => false
    t.string   "fieldLabel", :limit => 128,                                 :null => false
    t.string   "fieldName",  :limit => 64,                                  :null => false
    t.integer  "intValue"
    t.integer  "longValue",  :limit => 8
    t.decimal  "decValue",                   :precision => 18, :scale => 4
    t.datetime "dateValue"
    t.string   "strValue",   :limit => 5000
    t.integer  "boolValue",  :limit => 2
    t.binary   "blobValue"
    t.integer  "isShowed",   :limit => 2,                                   :null => false
  end

  add_index "form_data", ["formId"], :name => "FK_FD_R_PF"

  create_table "form_file", :id => false, :force => true do |t|
    t.integer "formId", :limit => 8, :null => false
    t.integer "fileId", :limit => 8, :null => false
  end

  add_index "form_file", ["fileId"], :name => "FK_FF_R_FA"

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.integer  "father_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_num"
    t.string   "code"
    t.integer  "page_temp_id"
  end

  create_table "friend_links", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_apply", :primary_key => "applyId", :force => true do |t|
    t.integer  "goodsId",        :limit => 8,   :null => false
    t.datetime "applyDate",                     :null => false
    t.string   "applyNo",        :limit => 128, :null => false
    t.integer  "useCounts",                     :null => false
    t.string   "proposer",       :limit => 32,  :null => false
    t.string   "notes",          :limit => 500
    t.integer  "approvalStatus", :limit => 2,   :null => false
  end

  add_index "goods_apply", ["goodsId"], :name => "FK_GA_R_OG"

  create_table "in_message", :primary_key => "receiveId", :force => true do |t|
    t.integer "messageId",    :limit => 8
    t.integer "userId",       :limit => 8,   :null => false
    t.integer "readFlag",     :limit => 2,   :null => false
    t.string  "userFullname", :limit => 128, :null => false
    t.integer "delFlag",      :limit => 2,   :null => false
  end

  create_table "in_stock", :primary_key => "buyId", :force => true do |t|
    t.integer  "goodsId",      :limit => 8,                                  :null => false
    t.string   "providerName", :limit => 128
    t.string   "stockNo",      :limit => 128,                                :null => false
    t.decimal  "price",                       :precision => 18, :scale => 2
    t.integer  "inCounts"
    t.decimal  "amount",                      :precision => 18, :scale => 2, :null => false
    t.datetime "inDate",                                                     :null => false
    t.string   "buyer",        :limit => 128
  end

  add_index "in_stock", ["goodsId"], :name => "FK_IS_R_OG"

  create_table "index_display", :primary_key => "indexId", :force => true do |t|
    t.string  "portalId", :limit => 64, :null => false
    t.integer "userId",   :limit => 8,  :null => false
    t.integer "colNum",                 :null => false
    t.integer "rowNum",                 :null => false
  end

  add_index "index_display", ["userId"], :name => "FK_ID_R_AU"

  create_table "jbpm4_deployment", :primary_key => "DBID_", :force => true do |t|
    t.text    "NAME_",      :limit => 2147483647
    t.integer "TIMESTAMP_", :limit => 8
    t.string  "STATE_"
  end

  create_table "jbpm4_deployprop", :primary_key => "DBID_", :force => true do |t|
    t.integer "DEPLOYMENT_", :limit => 8
    t.string  "OBJNAME_"
    t.string  "KEY_"
    t.string  "STRINGVAL_"
    t.integer "LONGVAL_",    :limit => 8
  end

  add_index "jbpm4_deployprop", ["DEPLOYMENT_"], :name => "FK_DEPLPROP_DEPL"
  add_index "jbpm4_deployprop", ["DEPLOYMENT_"], :name => "IDX_DEPLPROP_DEPL"

# Could not dump table "jbpm4_execution" because of following StandardError
#   Unknown type 'bit(1)' for column 'HASVARS_'

  create_table "jbpm4_hist_actinst", :primary_key => "DBID_", :force => true do |t|
    t.string   "CLASS_",                      :null => false
    t.integer  "DBVERSION_",                  :null => false
    t.integer  "HPROCI_",        :limit => 8
    t.string   "TYPE_"
    t.string   "EXECUTION_"
    t.string   "ACTIVITY_NAME_"
    t.datetime "START_"
    t.datetime "END_"
    t.integer  "DURATION_",      :limit => 8
    t.string   "TRANSITION_"
    t.integer  "NEXTIDX_"
    t.integer  "HTASK_",         :limit => 8
  end

  add_index "jbpm4_hist_actinst", ["HPROCI_"], :name => "FK_HACTI_HPROCI"
  add_index "jbpm4_hist_actinst", ["HPROCI_"], :name => "IDX_HACTI_HPROCI"
  add_index "jbpm4_hist_actinst", ["HTASK_"], :name => "FK_HTI_HTASK"
  add_index "jbpm4_hist_actinst", ["HTASK_"], :name => "IDX_HTI_HTASK"

  create_table "jbpm4_hist_detail", :primary_key => "DBID_", :force => true do |t|
    t.string   "CLASS_",                            :null => false
    t.integer  "DBVERSION_",                        :null => false
    t.string   "USERID_"
    t.datetime "TIME_"
    t.integer  "HPROCI_",     :limit => 8
    t.integer  "HPROCIIDX_"
    t.integer  "HACTI_",      :limit => 8
    t.integer  "HACTIIDX_"
    t.integer  "HTASK_",      :limit => 8
    t.integer  "HTASKIDX_"
    t.integer  "HVAR_",       :limit => 8
    t.integer  "HVARIDX_"
    t.text     "MESSAGE_",    :limit => 2147483647
    t.integer  "OLD_INT_"
    t.integer  "NEW_INT_"
    t.string   "OLD_STR_"
    t.string   "NEW_STR_"
    t.datetime "OLD_TIME_"
    t.datetime "NEW_TIME_"
    t.integer  "PARENT_",     :limit => 8
    t.integer  "PARENT_IDX_"
  end

  add_index "jbpm4_hist_detail", ["HACTI_"], :name => "FK_HDETAIL_HACTI"
  add_index "jbpm4_hist_detail", ["HACTI_"], :name => "IDX_HDETAIL_HACTI"
  add_index "jbpm4_hist_detail", ["HACTI_"], :name => "IDX_HDET_HACTI"
  add_index "jbpm4_hist_detail", ["HPROCI_"], :name => "FK_HDETAIL_HPROCI"
  add_index "jbpm4_hist_detail", ["HPROCI_"], :name => "IDX_HDETAIL_HPROCI"
  add_index "jbpm4_hist_detail", ["HPROCI_"], :name => "IDX_HDET_HPROCI"
  add_index "jbpm4_hist_detail", ["HTASK_"], :name => "FK_HDETAIL_HTASK"
  add_index "jbpm4_hist_detail", ["HTASK_"], :name => "IDX_HDETAIL_HTASK"
  add_index "jbpm4_hist_detail", ["HTASK_"], :name => "IDX_HDET_HTASK"
  add_index "jbpm4_hist_detail", ["HVAR_"], :name => "FK_HDETAIL_HVAR"
  add_index "jbpm4_hist_detail", ["HVAR_"], :name => "IDX_HDETAIL_HVAR"
  add_index "jbpm4_hist_detail", ["HVAR_"], :name => "IDX_HDET_HVAR"

  create_table "jbpm4_hist_procinst", :primary_key => "DBID_", :force => true do |t|
    t.integer  "DBVERSION_",                :null => false
    t.string   "ID_"
    t.string   "PROCDEFID_"
    t.string   "KEY_"
    t.datetime "START_"
    t.datetime "END_"
    t.integer  "DURATION_",    :limit => 8
    t.string   "STATE_"
    t.string   "ENDACTIVITY_"
    t.integer  "NEXTIDX_"
  end

  create_table "jbpm4_hist_task", :primary_key => "DBID_", :force => true do |t|
    t.integer  "DBVERSION_",              :null => false
    t.string   "EXECUTION_"
    t.string   "OUTCOME_"
    t.string   "ASSIGNEE_"
    t.integer  "PRIORITY_"
    t.string   "STATE_"
    t.datetime "CREATE_"
    t.datetime "END_"
    t.integer  "DURATION_",  :limit => 8
    t.integer  "NEXTIDX_"
    t.integer  "SUPERTASK_", :limit => 8
  end

  add_index "jbpm4_hist_task", ["SUPERTASK_"], :name => "FK_HSUPERT_SUB"

  create_table "jbpm4_hist_var", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",                :null => false
    t.string  "PROCINSTID_"
    t.string  "EXECUTIONID_"
    t.string  "VARNAME_"
    t.string  "VALUE_"
    t.integer "HPROCI_",      :limit => 8
    t.integer "HTASK_",       :limit => 8
  end

  add_index "jbpm4_hist_var", ["HPROCI_"], :name => "FK_HVAR_HPROCI"
  add_index "jbpm4_hist_var", ["HPROCI_"], :name => "IDX_HVAR_HPROCI"
  add_index "jbpm4_hist_var", ["HTASK_"], :name => "FK_HVAR_HTASK"
  add_index "jbpm4_hist_var", ["HTASK_"], :name => "IDX_HVAR_HTASK"

  create_table "jbpm4_id_group", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",              :null => false
    t.string  "ID_"
    t.string  "NAME_"
    t.string  "TYPE_"
    t.integer "PARENT_",    :limit => 8
  end

  add_index "jbpm4_id_group", ["PARENT_"], :name => "FK_GROUP_PARENT"
  add_index "jbpm4_id_group", ["PARENT_"], :name => "IDX_GROUP_PARENT"

  create_table "jbpm4_id_membership", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",              :null => false
    t.integer "USER_",      :limit => 8
    t.integer "GROUP_",     :limit => 8
    t.string  "NAME_"
  end

  add_index "jbpm4_id_membership", ["GROUP_"], :name => "FK_MEM_GROUP"
  add_index "jbpm4_id_membership", ["GROUP_"], :name => "IDX_MEM_GROUP"
  add_index "jbpm4_id_membership", ["USER_"], :name => "FK_MEM_USER"
  add_index "jbpm4_id_membership", ["USER_"], :name => "IDX_MEM_USER"

  create_table "jbpm4_id_user", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",     :null => false
    t.string  "ID_"
    t.string  "PASSWORD_"
    t.string  "GIVENNAME_"
    t.string  "FAMILYNAME_"
    t.string  "BUSINESSEMAIL_"
  end

# Could not dump table "jbpm4_job" because of following StandardError
#   Unknown type 'bit(1)' for column 'ISEXCLUSIVE_'

  create_table "jbpm4_lob", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",                        :null => false
    t.binary  "BLOB_VALUE_", :limit => 2147483647
    t.integer "DEPLOYMENT_", :limit => 8
    t.text    "NAME_",       :limit => 2147483647
  end

  add_index "jbpm4_lob", ["DEPLOYMENT_"], :name => "FK_LOB_DEPLOYMENT"
  add_index "jbpm4_lob", ["DEPLOYMENT_"], :name => "IDX_LOB_DEPLOYMENT"

  create_table "jbpm4_participation", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",              :null => false
    t.string  "GROUPID_"
    t.string  "USERID_"
    t.string  "TYPE_"
    t.integer "TASK_",      :limit => 8
    t.integer "SWIMLANE_",  :limit => 8
  end

  add_index "jbpm4_participation", ["SWIMLANE_"], :name => "FK_PART_SWIMLANE"
  add_index "jbpm4_participation", ["TASK_"], :name => "FK_PART_TASK"
  add_index "jbpm4_participation", ["TASK_"], :name => "IDX_PART_TASK"

  create_table "jbpm4_swimlane", :primary_key => "DBID_", :force => true do |t|
    t.integer "DBVERSION_",              :null => false
    t.string  "NAME_"
    t.string  "ASSIGNEE_"
    t.integer "EXECUTION_", :limit => 8
  end

  add_index "jbpm4_swimlane", ["EXECUTION_"], :name => "FK_SWIMLANE_EXEC"
  add_index "jbpm4_swimlane", ["EXECUTION_"], :name => "IDX_SWIMLANE_EXEC"

# Could not dump table "jbpm4_task" because of following StandardError
#   Unknown type 'bit(1)' for column 'SIGNALLING_'

# Could not dump table "jbpm4_variable" because of following StandardError
#   Unknown type 'bit(1)' for column 'HIST_'

  create_table "mail", :primary_key => "mailId", :force => true do |t|
    t.string   "sender",         :limit => 32,   :null => false
    t.integer  "senderId",       :limit => 8,    :null => false
    t.integer  "importantFlag",  :limit => 2,    :null => false
    t.datetime "sendTime",                       :null => false
    t.string   "content",        :limit => 5000, :null => false
    t.string   "subject",        :limit => 256,  :null => false
    t.string   "copyToNames",    :limit => 1000
    t.string   "copyToIDs",      :limit => 1000
    t.string   "recipientNames", :limit => 1000, :null => false
    t.string   "recipientIDs",   :limit => 1000, :null => false
    t.integer  "mailStatus",     :limit => 2,    :null => false
    t.string   "fileIds",        :limit => 500
    t.string   "filenames",      :limit => 500
  end

  add_index "mail", ["senderId"], :name => "FK_ML_R_AU"

  create_table "mail_attach", :id => false, :force => true do |t|
    t.integer "mailId", :limit => 8, :null => false
    t.integer "fileId", :limit => 8, :null => false
  end

  add_index "mail_attach", ["fileId"], :name => "FK_MA_R_FA"

  create_table "mail_box", :primary_key => "boxId", :force => true do |t|
    t.integer  "mailId",    :limit => 8,                  :null => false
    t.integer  "folderId",  :limit => 8,                  :null => false
    t.integer  "userId",    :limit => 8
    t.datetime "sendTime",                                :null => false
    t.integer  "delFlag",   :limit => 2,                  :null => false
    t.integer  "readFlag",  :limit => 2,                  :null => false
    t.string   "note",      :limit => 256
    t.integer  "replyFlag", :limit => 2,   :default => 0, :null => false
  end

  add_index "mail_box", ["folderId"], :name => "FK_MB_R_FD"
  add_index "mail_box", ["mailId"], :name => "FK_MB_R_ML"
  add_index "mail_box", ["userId"], :name => "FK_MB_R_AU"

  create_table "mail_folder", :primary_key => "folderId", :force => true do |t|
    t.integer "userId",     :limit => 8
    t.string  "folderName", :limit => 128, :null => false
    t.integer "parentId",   :limit => 8
    t.integer "depLevel",                  :null => false
    t.string  "path",       :limit => 256
    t.integer "isPublic",   :limit => 2,   :null => false
    t.integer "folderType", :limit => 2,   :null => false
  end

  add_index "mail_folder", ["userId"], :name => "FK_FD_R_AU"

  create_table "news", :primary_key => "newsId", :force => true do |t|
    t.integer  "typeId",      :limit => 8,                  :null => false
    t.string   "subjectIcon", :limit => 128
    t.string   "subject",     :limit => 128,                :null => false
    t.string   "author",      :limit => 32,                 :null => false
    t.datetime "createtime",                                :null => false
    t.integer  "replyCounts",                :default => 0
    t.integer  "viewCounts",                 :default => 0
    t.text     "content",                                   :null => false
    t.datetime "updateTime",                                :null => false
    t.integer  "status",      :limit => 2,                  :null => false
  end

  add_index "news", ["typeId"], :name => "FK_NS_R_NT"

  create_table "news_type", :primary_key => "typeId", :force => true do |t|
    t.string  "typeName", :limit => 256,                :null => false
    t.integer "sn",       :limit => 2,   :default => 0, :null => false
  end

  create_table "newstype", :primary_key => "typeId", :force => true do |t|
    t.string  "typeName", :limit => 128, :null => false
    t.integer "sn",                      :null => false
  end

  create_table "notice", :primary_key => "noticeId", :force => true do |t|
    t.string  "postName",       :limit => 128,  :null => false
    t.string  "noticeTitle",    :limit => 128,  :null => false
    t.string  "noticeContent",  :limit => 1024
    t.date    "effectiveDate"
    t.date    "expirationDate"
    t.integer "state",          :limit => 2
  end

  create_table "office_goods", :primary_key => "goodsId", :force => true do |t|
    t.integer "typeId",         :limit => 8,   :null => false
    t.string  "goodsName",      :limit => 128, :null => false
    t.string  "goodsNo",        :limit => 128, :null => false
    t.string  "specifications", :limit => 256, :null => false
    t.string  "unit",           :limit => 64,  :null => false
    t.integer "isWarning",      :limit => 2,   :null => false
    t.string  "notes",          :limit => 500
    t.integer "stockCounts",                   :null => false
    t.integer "warnCounts",                    :null => false
  end

  add_index "office_goods", ["typeId"], :name => "FK_OG_R_OGT"

  create_table "office_goods_type", :primary_key => "typeId", :force => true do |t|
    t.string "typeName", :limit => 128, :null => false
  end

  create_table "page_temps", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_book", :primary_key => "phoneId", :force => true do |t|
    t.string   "fullname",       :limit => 128, :null => false
    t.string   "title",          :limit => 32,  :null => false
    t.datetime "birthday"
    t.string   "nickName",       :limit => 32
    t.string   "duty",           :limit => 50
    t.string   "spouse",         :limit => 32
    t.string   "childs",         :limit => 40
    t.string   "companyName",    :limit => 100
    t.string   "companyAddress", :limit => 128
    t.string   "companyPhone",   :limit => 32
    t.string   "companyFax",     :limit => 32
    t.string   "homeAddress",    :limit => 128
    t.string   "homeZip",        :limit => 12
    t.string   "mobile",         :limit => 32
    t.string   "phone",          :limit => 32
    t.string   "email",          :limit => 32
    t.string   "QQ",             :limit => 64
    t.string   "MSN",            :limit => 128
    t.string   "note",           :limit => 500
    t.integer  "userId",         :limit => 8,   :null => false
    t.integer  "groupId",        :limit => 8
    t.integer  "isShared",       :limit => 2,   :null => false
  end

  add_index "phone_book", ["groupId"], :name => "FK_PB_R_PG"
  add_index "phone_book", ["userId"], :name => "FK_PB_R_AU"

  create_table "phone_group", :primary_key => "groupId", :force => true do |t|
    t.string  "groupName", :limit => 128, :null => false
    t.integer "isShared",  :limit => 2,   :null => false
    t.integer "SN",                       :null => false
    t.integer "userId",    :limit => 8,   :null => false
  end

  add_index "phone_group", ["userId"], :name => "FK_PG_R_AU"

  create_table "plan_attach", :id => false, :force => true do |t|
    t.integer "fileId", :limit => 8, :null => false
    t.integer "planId", :limit => 8, :null => false
  end

  add_index "plan_attach", ["planId"], :name => "FK_PA_R_WP"

  create_table "plan_type", :primary_key => "typeId", :force => true do |t|
    t.string "typeName", :limit => 64
  end

  create_table "pro_definition", :primary_key => "defId", :force => true do |t|
    t.integer  "typeId",      :limit => 8
    t.string   "name",        :limit => 256,  :null => false
    t.string   "description", :limit => 1024
    t.datetime "createtime"
    t.string   "deployId",    :limit => 64,   :null => false
    t.string   "defXml",      :limit => 4000
  end

  add_index "pro_definition", ["typeId"], :name => "FK_PD_R_PT"

  create_table "pro_type", :primary_key => "typeId", :force => true do |t|
    t.string "typeName", :limit => 128, :null => false
  end

  create_table "pro_user_assign", :primary_key => "assignId", :force => true do |t|
    t.string "deployId",     :limit => 128, :null => false
    t.string "activityName", :limit => 128, :null => false
    t.string "roleId",       :limit => 128
    t.string "roleName",     :limit => 256
    t.string "userId",       :limit => 128
    t.string "username",     :limit => 256
  end

  create_table "process_form", :primary_key => "formId", :force => true do |t|
    t.integer "runId",        :limit => 8,   :null => false
    t.string  "activityName", :limit => 128, :null => false
  end

  add_index "process_form", ["runId"], :name => "FK_PF_R_PR"

  create_table "process_run", :primary_key => "runId", :force => true do |t|
    t.string   "subject",    :limit => 256, :null => false
    t.string   "creator",    :limit => 128
    t.integer  "userId",     :limit => 8,   :null => false
    t.integer  "defId",      :limit => 8,   :null => false
    t.string   "piId",       :limit => 64
    t.datetime "createtime",                :null => false
  end

  add_index "process_run", ["defId"], :name => "FK_PR_R_PD"
  add_index "process_run", ["userId"], :name => "FK_PR_R_AU"

  create_table "project", :primary_key => "projectId", :force => true do |t|
    t.string  "projectName",   :limit => 128, :null => false
    t.string  "projectNo",     :limit => 64,  :null => false
    t.text    "reqDesc"
    t.integer "isContract",    :limit => 2,   :null => false
    t.string  "fullname",      :limit => 32,  :null => false
    t.string  "mobile",        :limit => 32
    t.string  "phone",         :limit => 32
    t.string  "fax",           :limit => 32
    t.string  "otherContacts", :limit => 128
    t.integer "customerId",    :limit => 8,   :null => false
    t.integer "userId",        :limit => 8,   :null => false
  end

  add_index "project", ["customerId"], :name => "FK_PR_R_CS"
  add_index "project", ["userId"], :name => "FK_PT_R_AU"

  create_table "project_file", :id => false, :force => true do |t|
    t.integer "fileId",    :limit => 8, :null => false
    t.integer "projectId", :limit => 8, :null => false
  end

  add_index "project_file", ["projectId"], :name => "FK_PF_R_PT"

  create_table "region", :primary_key => "regionId", :force => true do |t|
    t.string  "regionName", :limit => 128, :null => false
    t.integer "regionType", :limit => 2,   :null => false
    t.integer "parentId",   :limit => 8
  end

  create_table "report_template", :primary_key => "reportId", :force => true do |t|
    t.string   "title",          :limit => 128, :null => false
    t.string   "descp",          :limit => 500, :null => false
    t.string   "reportLocation", :limit => 128, :null => false
    t.string   "queryLocation",  :limit => 128
    t.datetime "createtime",                    :null => false
    t.datetime "updatetime",                    :null => false
  end

  create_table "short_message", :primary_key => "messageId", :force => true do |t|
    t.string   "content",  :limit => 256, :null => false
    t.integer  "senderId", :limit => 8,   :null => false
    t.string   "sender",   :limit => 64,  :null => false
    t.integer  "msgType",  :limit => 2,   :null => false
    t.datetime "sendTime",                :null => false
  end

  create_table "use_permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_role", :id => false, :force => true do |t|
    t.integer "userId", :limit => 8, :null => false
    t.integer "roleId", :limit => 8, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_plan", :primary_key => "planId", :force => true do |t|
    t.string  "planName",     :limit => 128,  :null => false
    t.string  "planContent",  :limit => 5000
    t.date    "startTime",                    :null => false
    t.date    "endTime",                      :null => false
    t.integer "typeId",       :limit => 8,    :null => false
    t.integer "userId",       :limit => 8
    t.string  "issueScope",   :limit => 2000
    t.string  "participants", :limit => 2000
    t.string  "principal",    :limit => 256,  :null => false
    t.string  "note",         :limit => 500
    t.integer "status",       :limit => 2,    :null => false
    t.integer "isPersonal",   :limit => 2,    :null => false
    t.string  "icon",         :limit => 128
  end

  add_index "work_plan", ["typeId"], :name => "FK_WP_R_PT"
  add_index "work_plan", ["userId"], :name => "FK_WP_R_AU"

end
