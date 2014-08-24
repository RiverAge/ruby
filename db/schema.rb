# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140824021858) do

  create_table "containers", force: true do |t|
    t.string   "状态"
    t.string   "提单号"
    t.string   "到港日期"
    t.string   "市场部确认时间"
    t.string   "货值"
    t.string   "品类"
    t.string   "单品数量"
    t.string   "需货检单品数量"
    t.string   "法检类型"
    t.string   "当前报检进度"
    t.string   "提样日期"
    t.string   "标签制作日期"
    t.string   "CIQ报检交单日期"
    t.string   "CIQ初审日期"
    t.string   "初审错误数量"
    t.string   "报检单改单日期"
    t.string   "CIQ复审日期"
    t.string   "换单时间"
    t.string   "抽样日期"
    t.string   "CIQ放行日期"
    t.string   "报检备注"
    t.string   "当前报关进度"
    t.string   "报关交单日期"
    t.string   "出关封日期"
    t.string   "仓库通知改单日期"
    t.string   "改单完毕日期"
    t.string   "报关备注"
    t.string   "通关用时"
    t.string   "理货进度"
    t.string   "提货日期"
    t.string   "箱数"
    t.string   "开始理货时间"
    t.string   "理货完毕时间"
    t.string   "理货单据制作完成时间"
    t.string   "送单时间"
    t.string   "理货负责人"
    t.string   "出货状态"
    t.string   "理货中心用时"
    t.string   "理货备注"
    t.string   "接单时间"
    t.string   "负责人"
    t.string   "基础信息录入开始时间"
    t.string   "基础信息录入状态"
    t.string   "入库状态"
    t.string   "入库提交时间"
    t.string   "海关入库完成时间"
    t.string   "入库天数"
    t.string   "出库状态"
    t.string   "出库完成时间"
    t.string   "出库天数"
    t.string   "出库提交时间"
    t.string   "信息录入备注"
    t.string   "完成天数"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "duties", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", force: true do |t|
    t.string   "报关单项数"
    t.string   "提单号"
    t.string   "箱号"
    t.string   "发票号"
    t.string   "发票序号"
    t.string   "品牌"
    t.string   "商品代码"
    t.string   "商品条码"
    t.string   "SKU_DESCRIPTION"
    t.string   "商品名称"
    t.string   "规格型号"
    t.string   "单价"
    t.string   "数量"
    t.string   "净重"
    t.string   "金额"
    t.string   "生产日期"
    t.string   "限期使用日期"
    t.string   "原产地"
    t.string   "出货类型"
    t.string   "备注"
    t.string   "库存区域"
    t.string   "库存"
    t.string   "负责人"
    t.string   "一号周转仓库存"
    t.string   "一号周转仓区域"
    t.string   "二号周转仓库存"
    t.string   "二号周转仓区域"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "launches", force: true do |t|
    t.string   "提单号"
    t.string   "商品代码"
    t.string   "商品名称"
    t.string   "出货类型"
    t.string   "出货时间"
    t.string   "出货数量"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "sharedfiles", force: true do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "category"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_goods", force: true do |t|
    t.string   "条码"
    t.string   "品牌"
    t.string   "商品名称"
    t.string   "规格型号"
    t.string   "数量"
    t.float    "零售价格"
    t.float    "最后进价"
    t.float    "进货金额"
    t.string   "特殊处理原因"
    t.string   "原因明细"
    t.string   "供货商"
    t.string   "存放区域"
    t.string   "备注"
    t.string   "处理方法"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
