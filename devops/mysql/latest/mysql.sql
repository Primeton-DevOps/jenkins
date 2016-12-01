drop table if exists DPS_BUILD_AGENT;
 
drop table if exists DPS_BUILD_ARTIFACT;
 
drop table if exists DPS_BUILD_DEFINITION;
 
drop table if exists DPS_BUILD_INSTANCE;
 
drop table if exists DPS_BUILD_PIPELINE;
 
drop table if exists DPS_BUILD_PIPELINE_TEMPLATE;
 
drop table if exists DPS_BUILD_STAGE;
 
drop table if exists DPS_BUILD_STAGE_ATTRIBUTE;
 
drop table if exists DPS_BUILD_STAGE_ATTRIBUTE_DEFINITION;
 
drop table if exists DPS_BUILD_STAGE_TEMPLATE;
 
drop table if exists DPS_CODE_REPOSITORY;
 
drop table if exists DPS_CODE_REPOSITORY_BRANCH;
 
drop table if exists DPS_CODE_REPOSITORY_TAG;
 
drop table if exists DPS_CODE_REPOSITORY_TYPE;
 
drop table if exists DPS_DLV_ASSEMBLY;
 
drop table if exists DPS_DLV_ASSEMBLY_RELEASE;
 
drop table if exists DPS_DLV_CLOUD_SERVICE;
 
drop table if exists DPS_DLV_CLOUD_SERVICE_RESOURCE;
 
drop table if exists DPS_DLV_CLOUD_SERVICE_TYPE;
 
drop table if exists DPS_DLV_COMP;
 
drop table if exists DPS_DLV_COMP_ATTRIBUTE;
 
drop table if exists DPS_DLV_COMP_ATTRIBUTE_DEFINITION;
 
drop table if exists DPS_DLV_COMP_ATTRIBUTE_RELEASE;
 
drop table if exists DPS_DLV_COMP_CONTAINER_DEFITION;
 
drop table if exists DPS_DLV_COMP_OPERATION;
 
drop table if exists DPS_DLV_COMP_RELATION;
 
drop table if exists DPS_DLV_COMP_RELATION_DEFINITION;
 
drop table if exists DPS_DLV_COMP_RELATION_RELEASE;
 
drop table if exists DPS_DLV_COMP_RELEASE;
 
drop table if exists DPS_DLV_COMP_TEMPLATE;
 
drop table if exists DPS_DLV_COMP_TEMPLATE_SCRIPT;
 
drop table if exists DPS_DLV_CONFIG_META_RELEASE;
 
drop table if exists DPS_DLV_CONFIG_META_UNCOMMIT;
 
drop table if exists DPS_DLV_CONFIG_VALUE;
 
drop table if exists DPS_DLV_DATACENTER;
 
drop table if exists DPS_DLV_DEPLOY_AGENT;
 
drop table if exists DPS_DLV_DEPLOY_ARTIFACT;
 
drop table if exists DPS_DLV_DEPLOY_COMPONENT_INSTANCE;
 
drop table if exists DPS_DLV_DEPLOY_ENVIRONMENT;
 
drop table if exists DPS_DLV_DEPLOY_INSTANCE;
 
drop table if exists DPS_DLV_DEPLOY_PIPELINE;
 
drop table if exists DPS_DLV_PLATFORM;
 
drop table if exists DPS_DLV_PLATFORM_RELEASE;
 
drop table if exists DPS_DLV_PLATFORM_RESOURCE_PLAN;
 
drop table if exists DPS_DLV_PLATFORM_TEMPLATE;
 
drop table if exists DPS_DLV_R_DATACENTER_CLOUD_SERVICE_TYPE;
 
drop table if exists DPS_INFRA_OPERATION_LOG;
 
drop table if exists DPS_INFRA_OPERATION_LOG_DETAIL;
 
drop table if exists DPS_INFRA_R_TAG_OBJECT;
 
drop table if exists DPS_INFRA_TAG;
 
drop table if exists DPS_INFRA_TENANT;
 
drop table if exists DPS_INFRA_THEME;
 
drop table if exists DPS_INFRA_UISERVICE;
 
drop table if exists DPS_INFRA_UISERVICE_TYPE;
 
drop table if exists DPS_INFRA_WORKFLOW_STATUS;
 
drop table if exists DPS_INFRA_WORKFLOW_TRANSITION;
 
drop table if exists DPS_INFRA_WORKFLOW_TYPE;
 
drop table if exists DPS_INFRA_WORKITEM;
 
drop table if exists DPS_INFRA_WORKITEM_ATTACHMENT;
 
drop table if exists DPS_INFRA_WORKITEM_ATTACHMENT_FILING;
 
drop table if exists DPS_INFRA_WORKITEM_ATTR;
 
drop table if exists DPS_INFRA_WORKITEM_ATTR_DEFINITION;
 
drop table if exists DPS_INFRA_WORKITEM_ATTR_FILING;
 
drop table if exists DPS_INFRA_WORKITEM_FILING;
 
drop table if exists DPS_INFRA_WORKITEM_RELATION;
 
drop table if exists DPS_INFRA_WORKITEM_RELATION_TYPE;
 
drop table if exists DPS_INFRA_WORKITEM_TYPE;
 
drop table if exists DPS_PDM_BUSINESS_DOMAIN;
 
drop table if exists DPS_PDM_PRODUCT;
 
drop table if exists DPS_PDM_PRODUCT_LINE;
 
drop table if exists DPS_PDM_PRODUCT_VERSION;
 
drop table if exists DPS_PDM_REQURIMENT_BASELINE;
 
drop table if exists DPS_PDM_R_PRODUCT_REQURIMENT;
 
drop table if exists DPS_PDM_R_VERSION_DELIVER;
 
drop table if exists DPS_PDM_VERSION_RELEASE;
 
drop table if exists DPS_PJM_ITERATION;
 
drop table if exists DPS_PJM_MILESTONE;
 
drop table if exists DPS_PJM_PROJECT;
 
drop table if exists DPS_PJM_R_PORJECT_MEETING;
 
drop table if exists DPS_PJM_R_TASK_ITERATION;
 
drop table if exists DPS_PJM_TEST_CASE;
 
drop table if exists DPS_PJM_TEST_DATASET;
 
drop table if exists DPS_PJM_TEST_PLAN;
 
drop table if exists DPS_PJM_TEST_RESULT;
 
drop table if exists DPS_PJM_TEST_RUN;
 
drop table if exists DPS_PJM_TEST_STEP;
 
drop table if exists DPS_PJM_TEST_SUITE;
 
drop table if exists DPS_R_PJM_ROLE_PROJECT;
 
drop table if exists DPS_R_PRODUCT_CODE;
 
drop table if exists DPS_R_PRODUCT_PROJECT;
 
drop table if exists DPS_R_PROJECT_CODE;
 
drop table if exists DPS_R_UC_ROLE_FUNC_TEMPLATE;
 
drop table if exists DPS_R_UC_ROLE_TYPE;
 
drop table if exists DPS_UC_ROLE_TEMPLATE;
 
/*==============================================================*/
/* Table: DPS_BUILD_AGENT                                       */
/*==============================================================*/
create table DPS_BUILD_AGENT
(
   AGENT_ID             varchar(64) not null,
   AGENT_NAME           varchar(64) comment '代理名称',
   SERVICE_HOST         varchar(128) comment '服务主机',
   BUILD_DIRECTORY      varchar(128) comment '构建目录',
   DESCRIPTION          text,
   AGENT_STATUS         varchar(64) comment '代理状态',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (AGENT_ID)
);
 
alter table DPS_BUILD_AGENT comment '构建代理表';
 
/*==============================================================*/
/* Table: DPS_BUILD_ARTIFACT                                    */
/*==============================================================*/
create table DPS_BUILD_ARTIFACT
(
   ARTIFACT_ID          varchar(64) not null,
   BUILD_ID             varchar(64) comment '构建ID',
   ARTIFACT_TYPE        varchar(64) comment '类型',
   ARTIFACT_NAME        varchar(64) comment '名称',
   DETAIL               blob comment '构建详情',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ARTIFACT_ID)
);
 
alter table DPS_BUILD_ARTIFACT comment '构建产物表';
 
/*==============================================================*/
/* Table: DPS_BUILD_DEFINITION                                  */
/*==============================================================*/
create table DPS_BUILD_DEFINITION
(
   DEFINITION_ID        varchar(64) not null,
   DEFINITION_NAME      varchar(64) not null comment '定义名称',
   DEFINITION_VERSION   varchar(64) comment '定义版本',
   BRANCH_ID            varchar(64) comment '分支ID',
   PIPELINE_TP_ID       varchar(64) comment '管道模板ID',
   PIPELINE_ID          varchar(64) comment '管道ID',
   PROJECT_ID           varchar(64) comment '项目ID',
   AGENT_ID             varchar(64) comment '代理ID',
   PRIORITY             varchar(64) comment '权重',
   DESCRIPTION          text,
   TRIGGER_TYPE         varchar(64) comment '触发类型',
   BUILD_NUMBER_FORMAT  varchar(64) comment '构建数量格式化',
   TIMEOUT_SCOPE        int comment '超时范围',
   REPOSITORY           text comment '存储库',
   TRIGGER_REGEX        text comment '触发正则表达式',
   RETENTION            text comment '保留',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (DEFINITION_ID)
);
 
alter table DPS_BUILD_DEFINITION comment '构建定义表';
 
/*==============================================================*/
/* Table: DPS_BUILD_INSTANCE                                    */
/*==============================================================*/
create table DPS_BUILD_INSTANCE
(
   BUILD_ID             varchar(64) not null,
   DEFINITION_ID        varchar(64) comment '构建定义ID',
   DEFINITION_VERSION   varchar(64) comment '构建定义版本',
   BUILD_NUMBER         varchar(64) comment '构建编码',
   BEGIN_TIME           datetime comment '开始时间',
   END_TIME             datetime comment '截止时间',
   INSTANCE_STATUS      varchar(64) comment '实例状态',
   RESULT               varchar(64) comment '构建结果',
   REASON               text comment '原因',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (BUILD_ID)
);
 
alter table DPS_BUILD_INSTANCE comment '构建实例表';
 
/*==============================================================*/
/* Table: DPS_BUILD_PIPELINE                                    */
/*==============================================================*/
create table DPS_BUILD_PIPELINE
(
   PIPELINE_TP_ID       varchar(64) not null,
   DESCRIPTION          text,
   STAGES               text comment '构建阶段',
   SCRIPT_CONTENT       text comment '脚本内容',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PIPELINE_TP_ID)
);
 
alter table DPS_BUILD_PIPELINE comment '构建管道表';
 
/*==============================================================*/
/* Table: DPS_BUILD_PIPELINE_TEMPLATE                           */
/*==============================================================*/
create table DPS_BUILD_PIPELINE_TEMPLATE
(
   PIPELINE_TP_ID       varchar(64) not null,
   PIPELINE_TP_NAME     varchar(64) comment '管道模板名称',
   PIPELINE_TP_TYPE     varchar(64) comment '模板类型',
   DESCRIPTION          text,
   STAGES               text comment '阶段',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PIPELINE_TP_ID)
);
 
alter table DPS_BUILD_PIPELINE_TEMPLATE comment '构建管道模板表';
 
/*==============================================================*/
/* Table: DPS_BUILD_STAGE                                       */
/*==============================================================*/
create table DPS_BUILD_STAGE
(
   STAGE_ID             varchar(64) not null,
   STAGE_NAME           varchar(64),
   STAGE_TP_ID          varchar(64),
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (STAGE_ID)
);
 
/*==============================================================*/
/* Table: DPS_BUILD_STAGE_ATTRIBUTE                             */
/*==============================================================*/
create table DPS_BUILD_STAGE_ATTRIBUTE
(
   ATTR_ID              varchar(64) not null,
   STAGE_ID             varchar(64) comment '阶段ID',
   ATTR_DEF_ID          varchar(64) comment '属性定义ID',
   INT_VALUE            int comment '整型值',
   FLOAT_VALUE          float comment '浮点类型值',
   DATETIME_VALUE       datetime comment '时间类型值',
   STRING_VALUE         varchar(128) comment '字符类型值',
   TEXT_VALUE           text comment '文本类型值',
   BLOB_VALUE           blob comment '大字段类型值',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_ID)
);
 
alter table DPS_BUILD_STAGE_ATTRIBUTE comment '构建阶段属性表';
 
/*==============================================================*/
/* Table: DPS_BUILD_STAGE_ATTRIBUTE_DEFINITION                  */
/*==============================================================*/
create table DPS_BUILD_STAGE_ATTRIBUTE_DEFINITION
(
   ATTR_DEFINITION_ID   varchar(64) not null,
   ATTR_DEF_NAME        varchar(64) comment '属性定义名称',
   ATTR_DEF_LABEL       varchar(64) comment '显示名称',
   STAGE_TP_ID          varchar(64) comment '阶段模板ID',
   SOURCE               char comment '属性来源',
   SORT                 int comment '排序',
   CATEGORY             varchar(64) comment '类别',
   IS_REQUIRED          char comment '是否必须',
   IS_INHERITABLE       char comment '是否可继承',
   IS_ENCRYPTED         char comment '是否加密',
   IS_IMMUTABLE         char comment '是否不可变',
   DISPLAY_FORMAT       text comment '显示格式',
   TIP                  text comment '提示信息',
   DEFAULT_VALUE        varchar(128) comment '默认值',
   FIELD_TYPE           varchar(64) comment '类型',
   VALUE_PROVIDER       text comment '值提供者',
   CHECK_POLICY         varchar(64) comment '检查策略',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_DEFINITION_ID)
);
 
alter table DPS_BUILD_STAGE_ATTRIBUTE_DEFINITION comment '构建阶段属性定义表';
 
/*==============================================================*/
/* Table: DPS_BUILD_STAGE_TEMPLATE                              */
/*==============================================================*/
create table DPS_BUILD_STAGE_TEMPLATE
(
   STAGE_TP_ID          varchar(64) not null,
   STAGE_TP_NAME        varchar(64) comment '阶段模板名称',
   STAGE_TP_TYPE        varchar(64) comment '构建阶段类型',
   DESCRIPTION          text,
   TO_SCRIPT            text comment '生成脚本',
   LAYOUT               varchar(128) comment '模板布局',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (STAGE_TP_ID)
);
 
alter table DPS_BUILD_STAGE_TEMPLATE comment '构建阶段模板表';
 
/*==============================================================*/
/* Table: DPS_CODE_REPOSITORY                                   */
/*==============================================================*/
create table DPS_CODE_REPOSITORY
(
   REPO_ID              varchar(64) not null,
   REPO_NAME            varchar(64) comment '库名',
   REPO_TYPE_ID         varchar(64) comment '代码库类型ID',
   REPO_URL             varchar(512) comment '代码库URL',
   TARGET_SYSTEM        varchar(64) comment '目标系统',
   DESCRIPTION          text,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (REPO_ID)
);
 
alter table DPS_CODE_REPOSITORY comment '代码库表';
 
/*==============================================================*/
/* Table: DPS_CODE_REPOSITORY_BRANCH                            */
/*==============================================================*/
create table DPS_CODE_REPOSITORY_BRANCH
(
   BRANCH_ID            varchar(64) not null,
   BRANCH_NAME          varchar(64) comment '分支名称',
   REPO_ID              varchar(64) comment '代码库ID',
   IS_LOCKED            char comment '是否锁定',
   IS_DEFAULT           char comment '是否默认',
   DESCRIPTION          text,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (BRANCH_ID)
);
 
alter table DPS_CODE_REPOSITORY_BRANCH comment '代码库分支表';
 
/*==============================================================*/
/* Table: DPS_CODE_REPOSITORY_TAG                               */
/*==============================================================*/
create table DPS_CODE_REPOSITORY_TAG
(
   TAG_ID               varchar(64) not null,
   TAG_NAME             varchar(64) not null comment '标签名',
   BRANCH_ID            varchar(64) comment '分支ID',
   BUILD_ID             varchar(64) comment '构建ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (TAG_ID)
);
 
alter table DPS_CODE_REPOSITORY_TAG comment '代码库标签表';
 
/*==============================================================*/
/* Table: DPS_CODE_REPOSITORY_TYPE                              */
/*==============================================================*/
create table DPS_CODE_REPOSITORY_TYPE
(
   REPO_TYPE_ID         varchar(64) not null,
   REPO_TYPE_NAME       varchar(64) not null comment '类型名称',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (REPO_TYPE_ID)
);
 
alter table DPS_CODE_REPOSITORY_TYPE comment '代码库类型';
 
/*==============================================================*/
/* Table: DPS_DLV_ASSEMBLY                                      */
/*==============================================================*/
create table DPS_DLV_ASSEMBLY
(
   ASSEMBLY_ID          varchar(64) not null,
   ASSEMBLY_NAME        varchar(64) comment '装配名称',
   DESCRIPTION          text comment '描述',
   PROJECT_ID           varchar(64) comment '项目ID',
   PRODUCT_VERSION_ID   varchar(64) comment '产品版本ID',
   ASSEMBLY_STATUS      varchar(64) comment '装配状态',
   CHANGES              int comment '变化',
   LAST_COMMIT_ACTION   varchar(64) comment '最后一次提交动作',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ASSEMBLY_ID)
);
 
alter table DPS_DLV_ASSEMBLY comment '装配表';
 
/*==============================================================*/
/* Table: DPS_DLV_ASSEMBLY_RELEASE                              */
/*==============================================================*/
create table DPS_DLV_ASSEMBLY_RELEASE
(
   ASSEMBLY_RELEASE_ID  varchar(64) not null,
   ASSEMBLY_NAME        varchar(64) comment '装配名称',
   VERSION              varchar(64) comment '版本',
   SOURCE_ASSEMBLY_ID   varchar(64) comment '资源装配ID',
   DESCRIPTION          text,
   PROJECT_ID           varchar(64) comment '项目ID',
   PRODUCT_VERSION_ID   varchar(64) comment '产品版本ID',
   ASSEMBLY_STATUS      varchar(64) comment '装配状态',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ASSEMBLY_RELEASE_ID)
);
 
alter table DPS_DLV_ASSEMBLY_RELEASE comment '装配发布表';
 
/*==============================================================*/
/* Table: DPS_DLV_CLOUD_SERVICE                                 */
/*==============================================================*/
create table DPS_DLV_CLOUD_SERVICE
(
   SERVICE_ID           varchar(64) not null comment '服务ID',
   SERVICE_NAME         varchar(64) not null comment '服务名称',
   PROJECT_ID           varchar(64) comment '项目ID',
   DESCRIPTION          text,
   OWNER_ID             varchar(64) comment '所有者ID',
   SERVICE_STATUS       varchar(64) comment '服务状态',
   NOTIFY_MODE          varchar(64) comment '通知模式',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (SERVICE_ID)
);
 
alter table DPS_DLV_CLOUD_SERVICE comment '云服务表';
 
/*==============================================================*/
/* Table: DPS_DLV_CLOUD_SERVICE_RESOURCE                        */
/*==============================================================*/
create table DPS_DLV_CLOUD_SERVICE_RESOURCE
(
   RESOURCE_ID          varchar(64) not null comment '资源ID',
   RESOURCE_NAME        varchar(64) comment '资源名称',
   AGGREGATE_ID         varchar(64) comment '综合ID',
   SERVICE_ID           varchar(64) comment '服务ID',
   SERVICE_TYPE_ID      varchar(64) comment '服务类型ID',
   RESOURCE_DETAIL      text comment '包括状态最好都记录下来',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RESOURCE_ID)
);
 
alter table DPS_DLV_CLOUD_SERVICE_RESOURCE comment '云服务资源表';
 
/*==============================================================*/
/* Table: DPS_DLV_CLOUD_SERVICE_TYPE                            */
/*==============================================================*/
create table DPS_DLV_CLOUD_SERVICE_TYPE
(
   SERVICE_TYPE_ID      varchar(64) not null,
   SERVICE_TYPE_NAME    varchar(64),
   CATALOG              varchar(64) comment '目录',
   DISPLAY_ORDER        int comment '显示顺序',
   DETAIL               text,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (SERVICE_TYPE_ID)
);
 
alter table DPS_DLV_CLOUD_SERVICE_TYPE comment '云服务类型表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP                                          */
/*==============================================================*/
create table DPS_DLV_COMP
(
   COMP_ID              varchar(64) not null,
   COMP_NAME            varchar(64) comment '组件名称',
   COMP_LABEL           varchar(64) comment '组件标签',
   PLATFORM_ID          varchar(64) comment '平台ID',
   COMP_TP_ID           varchar(64) comment '组件模板ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (COMP_ID)
);
 
alter table DPS_DLV_COMP comment '组件表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_ATTRIBUTE                                */
/*==============================================================*/
create table DPS_DLV_COMP_ATTRIBUTE
(
   ATTR_ID              varchar(64) not null,
   ATTR_DEF_ID          varchar(64) comment '属性定义ID',
   COMP_ID              varchar(64) comment '组件ID',
   INT_VALUE            int comment '整型值',
   FLOAT_VALUE          float comment '浮点值',
   DATETIME_VALUE       datetime comment '日期值',
   STRING_VALUE         varchar(128) comment '字符值',
   TEXT_VALUE           text comment '文本值',
   BLOB_VALUE           blob comment '大字段值',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_ID)
);
 
alter table DPS_DLV_COMP_ATTRIBUTE comment '组件属性表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_ATTRIBUTE_DEFINITION                     */
/*==============================================================*/
create table DPS_DLV_COMP_ATTRIBUTE_DEFINITION
(
   ATTR_DEFINITION_ID   varchar(64) not null,
   ATTR_DEF_NAME        varchar(64) comment '名称',
   ATTR_DEF_LABEL       varchar(64) comment '标签',
   COMP_TP_ID           varchar(64) comment '组件模板ID',
   SOURCE               char comment '来源',
   SORT                 int comment '排序',
   CATEGORY             varchar(64) comment '种类',
   IS_REQUIRED          char comment '是否必须',
   IS_INHERITABLE       char comment '是否可继承',
   IS_ENCRYPTED         char comment '是否加密',
   IS_IMMUTABLE         char comment '是否不可变',
   IS_IMPORTANT         char comment '是否重要的',
   DISPLAY_FORMAT       text comment '显示格式',
   TIP                  text comment '提示',
   DEFAULT_VALUE        varchar(128) comment '默认值',
   FIELD_TYPE           varchar(64) comment '领域类型',
   VALUE_PROVIDER       text comment '值提供者',
   CHECK_POLICY         varchar(64) comment '检查策略',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_DEFINITION_ID)
);
 
alter table DPS_DLV_COMP_ATTRIBUTE_DEFINITION comment '组件属性定义表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_ATTRIBUTE_RELEASE                        */
/*==============================================================*/
create table DPS_DLV_COMP_ATTRIBUTE_RELEASE
(
   ATTR_RELEASE_ID      varchar(64) not null,
   ATTR_DEF_ID          varchar(64) comment '属性定义ID',
   COMP_RELEASE_ID      varchar(64) comment '组件发布ID',
   SOURCE_ATTR_ID       varchar(64),
   INT_VALUE            int,
   FLOAT_VALUE          float,
   DATETIME_VALUE       datetime,
   STRING_VALUE         varchar(128),
   TEXT_VALUE           text,
   BLOB_VALUE           blob,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_RELEASE_ID)
);
 
alter table DPS_DLV_COMP_ATTRIBUTE_RELEASE comment '组件属性发布表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_CONTAINER_DEFITION                       */
/*==============================================================*/
create table DPS_DLV_COMP_CONTAINER_DEFITION
(
   DEINITION_ID         varchar(64) not null,
   PLATFORM_TP_ID       varchar(64) not null comment '平台模板ID',
   COMP_TP_ID           varchar(64) not null comment '组件模板ID',
   INSTALL_TYPE         varchar(64) comment '安装方式：INNER（内部安装），OUTTER（外部引用）',
   LAYER                int comment '层次',
   ALLOW_MAX_NUM        int comment '最大数量',
   DEFAULT_NUM          int comment '默认数量',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (DEINITION_ID)
);
 
alter table DPS_DLV_COMP_CONTAINER_DEFITION comment '组件容器定义表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_OPERATION                                */
/*==============================================================*/
create table DPS_DLV_COMP_OPERATION
(
   OPERATION_ID         varchar(64) not null,
   OPERATION_NAME       varchar(64),
   DESCRIPTION          text,
   COMP_TP_ID           varchar(64) comment '组件模板ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (OPERATION_ID)
);
 
alter table DPS_DLV_COMP_OPERATION comment '组件操作表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_RELATION                                 */
/*==============================================================*/
create table DPS_DLV_COMP_RELATION
(
   RELATION_ID          varchar(64) not null,
   FROM_COMP_ID         varchar(64) comment '组件来源ID',
   TO_COMP_ID           varchar(64) comment '组件应用ID',
   DESCRIPTION          text comment '描述',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELATION_ID)
);
 
alter table DPS_DLV_COMP_RELATION comment '组件关系表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_RELATION_DEFINITION                      */
/*==============================================================*/
create table DPS_DLV_COMP_RELATION_DEFINITION
(
   RELATION_ID          varchar(64) not null,
   RELEATION_TYPE       varchar(64) comment '关系类型',
   PLATFORM_TP_ID       varchar(64) comment '平台模板ID',
   FROM_COMP_TP_ID      varchar(64) comment '组件模板来源ID',
   TO_COMP_TP_ID        varchar(64) comment '组件模板应用ID',
   DESCRIPTION          text,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELATION_ID)
);
 
alter table DPS_DLV_COMP_RELATION_DEFINITION comment '组件关系定义表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_RELATION_RELEASE                         */
/*==============================================================*/
create table DPS_DLV_COMP_RELATION_RELEASE
(
   RELATION_RELEASE_ID  varchar(64) not null,
   FROM_COMP_RELEASE_ID varchar(64) comment '组件发布来源ID',
   TO_COMP_RELEASE_ID   varchar(64),
   SOURCE_RELATION_ID   varchar(64) comment '关系来源表',
   DESCRIPTION          text,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELATION_RELEASE_ID)
);
 
alter table DPS_DLV_COMP_RELATION_RELEASE comment '组件关系发布表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_RELEASE                                  */
/*==============================================================*/
create table DPS_DLV_COMP_RELEASE
(
   COMP_RELEASE_ID      varchar(64) not null,
   COMP_NAME            varchar(64),
   COMP_LABEL           varchar(64),
   PLATFORM_RELEASE_ID  varchar(64) comment '平台发布ID',
   SOURCE_COMP_ID       varchar(64) comment '组件来源ID',
   COMP_TP_ID           varchar(64) comment '组件模板ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (COMP_RELEASE_ID)
);
 
alter table DPS_DLV_COMP_RELEASE comment '组件发布表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_TEMPLATE                                 */
/*==============================================================*/
create table DPS_DLV_COMP_TEMPLATE
(
   COMP_TP_ID           varchar(64) not null,
   COMP_TP_NAME         varchar(64) comment '组件模板名称',
   COMP_TP_TYPE         varchar(64) comment '类型',
   DESCRIPTION          text comment '描述',
   LAYOUT               varchar(128) comment '组件布局',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (COMP_TP_ID)
);
 
alter table DPS_DLV_COMP_TEMPLATE comment '组件模板表';
 
/*==============================================================*/
/* Table: DPS_DLV_COMP_TEMPLATE_SCRIPT                          */
/*==============================================================*/
create table DPS_DLV_COMP_TEMPLATE_SCRIPT
(
   SCRIPT_ID            varchar(64) not null,
   COMP_TP_ID           varchar(64) comment '组件模板ID',
   SERVICE_TYPE_ID      varchar(64) comment '服务类型ID',
   DEPLOY_MODE          varchar(64) comment '部署方式',
   OPERATION_ID         varchar(64) comment '操作ID',
   SCRIPT               text comment '脚本类容',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (SCRIPT_ID)
);
 
alter table DPS_DLV_COMP_TEMPLATE_SCRIPT comment '组件模板脚本表';
 
/*==============================================================*/
/* Table: DPS_DLV_CONFIG_META_RELEASE                           */
/*==============================================================*/
create table DPS_DLV_CONFIG_META_RELEASE
(
   CONFIG_RELEASE_META_ID varchar(64) not null,
   SOURCE_META_ID       varchar(64),
   ASSEMBLY_RELEASE_ID  varchar(64) comment '组装释放ID',
   PROPERTY_KEY         varchar(64) comment '性能键',
   DEFAULT_VALUE        varchar(256) comment '默认值',
   DESCRIPTION          text,
   OBJECT_TYPE          varchar(64),
   OBJECT_ID            varchar(64),
   SORT                 int,
   CATEGORY             varchar(64) comment '类别',
   IS_REQUIRED          char comment '是否必须',
   IS_INHERITABLE       char comment '是否可被继承',
   IS_ENCRYPTED         char comment '是否加密',
   IS_IMMUTABLE         char comment '是否不可变',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (CONFIG_RELEASE_META_ID)
);
 
alter table DPS_DLV_CONFIG_META_RELEASE comment '配置元数据发布表';
 
/*==============================================================*/
/* Table: DPS_DLV_CONFIG_META_UNCOMMIT                          */
/*==============================================================*/
create table DPS_DLV_CONFIG_META_UNCOMMIT
(
   CONFIG_META_ID       varchar(64) not null,
   PROPERTY_KEY         varchar(64) comment '属性键名称',
   DEFAULT_VALUE        varchar(256),
   DESCRIPTION          text,
   ASSEMBLY_ID          varchar(64) comment '装配ID',
   OBJECT_TYPE          varchar(64),
   OBJECT_ID            varchar(64),
   SORT                 int comment '排序',
   CATEGORY             varchar(64) comment '分类',
   IS_REQUIRED          char comment '是否必须',
   IS_INHERITABLE       char comment '是否可被继承',
   IS_ENCRYPTED         char comment '是否加密',
   IS_IMMUTABLE         char comment '是否不可变',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (CONFIG_META_ID)
);
 
alter table DPS_DLV_CONFIG_META_UNCOMMIT comment '交付配置元数据';
 
/*==============================================================*/
/* Table: DPS_DLV_CONFIG_VALUE                                  */
/*==============================================================*/
create table DPS_DLV_CONFIG_VALUE
(
   CONFIG_ID            varchar(64) not null,
   CONFIG_RELEASE_META_ID varchar(64) comment '配置释放元ID',
   ENV_ID               varchar(64) comment '环境ID',
   PROPERTY_VALUE       varchar(256) comment '性能值',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (CONFIG_ID)
);
 
alter table DPS_DLV_CONFIG_VALUE comment '配置值表';
 
/*==============================================================*/
/* Table: DPS_DLV_DATACENTER                                    */
/*==============================================================*/
create table DPS_DLV_DATACENTER
(
   AGGREGATE_ID         varchar(64) not null,
   AGGREGATE_NAME       varchar(64) comment '集合名称',
   ZONE                 varchar(64) comment '区域',
   DESCRIPTION          text,
   DISPLAY_ORDER        int comment '显示顺序',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (AGGREGATE_ID)
);
 
alter table DPS_DLV_DATACENTER comment '数据中心表';
 
/*==============================================================*/
/* Table: DPS_DLV_DEPLOY_AGENT                                  */
/*==============================================================*/
create table DPS_DLV_DEPLOY_AGENT
(
   AGENT_ID             varchar(64) not null,
   AGENT_NAME           varchar(64) comment '代理名称',
   SERVICE_HOST         varchar(128) comment '服务主机',
   TARGET_ENV_CLUSTER   varchar(64) comment '目标集群环境',
   DESCRIPTION          text,
   AGENT_STATUS         varchar(64) comment '代理状态',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (AGENT_ID)
);
 
alter table DPS_DLV_DEPLOY_AGENT comment '部署代理表';
 
/*==============================================================*/
/* Table: DPS_DLV_DEPLOY_ARTIFACT                               */
/*==============================================================*/
create table DPS_DLV_DEPLOY_ARTIFACT
(
   ARTIFACT_ID          varchar(64) not null,
   ARTIFACT_TYPE_ID     varchar(64) comment '部署产物类型ID',
   DEPLOY_ID            varchar(64),
   DETAIL               blob,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ARTIFACT_ID)
);
 
alter table DPS_DLV_DEPLOY_ARTIFACT comment '部署产物';
 
/*==============================================================*/
/* Table: DPS_DLV_DEPLOY_COMPONENT_INSTANCE                     */
/*==============================================================*/
create table DPS_DLV_DEPLOY_COMPONENT_INSTANCE
(
   COMP_INSTANCE_ID     varchar(64) not null,
   COMP_RELEASE_ID      varchar(64) comment '组件部署ID',
   FROM_PIPELINE        varchar(64) comment '管道来源',
   ENV_ID               varchar(64) comment '环境ID',
   DETAIL               text comment '详情',
   INSTANCE_STATUS      varchar(64) comment '实例状态',
   LAST_OPERATION       varchar(64) comment '最后一次操作',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (COMP_INSTANCE_ID)
);
 
alter table DPS_DLV_DEPLOY_COMPONENT_INSTANCE comment '部署组件实例表';
 
/*==============================================================*/
/* Table: DPS_DLV_DEPLOY_ENVIRONMENT                            */
/*==============================================================*/
create table DPS_DLV_DEPLOY_ENVIRONMENT
(
   ENV_ID               varchar(64) not null,
   ENV_NAME             varchar(64) comment '环境名称',
   DESCRIPTION          text,
   ENV_STATUS           varchar(64) comment '环境状态',
   DEPLOY_MODE          varchar(64) comment '部署模式',
   ASSEMBLY_ID          varchar(64) comment '装配ID',
   TARGET_AGGREGATE     varchar(64) comment '目标集合',
   TARGET_SERVICE       varchar(64) comment '目标服务',
   RESOURCE_DETAIL      text comment '资源详情',
   EXEC_OPTIONS         text comment '执行选项',
   NEED_APPROVE         char comment '是否批准',
   APPROVER             varchar(64) comment '批准',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ENV_ID)
);
 
alter table DPS_DLV_DEPLOY_ENVIRONMENT comment '部署环境表';
 
/*==============================================================*/
/* Table: DPS_DLV_DEPLOY_INSTANCE                               */
/*==============================================================*/
create table DPS_DLV_DEPLOY_INSTANCE
(
   DEPLOY_ID            varchar(64) not null,
   DEPLOY_NAME          varchar(64) comment '部署名称',
   DESCRIPTION          text,
   PIPELINE_ID          varchar(64) comment '管道ID',
   DEL_FLAG             char,
   INSTANCE_STATUS      varchar(64) comment '实例状态',
   BEGIN_TIME           datetime,
   END_TIME             datetime,
   RESULT               varchar(64) comment '部署结果',
   REASON               text comment '失败原因',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (DEPLOY_ID)
);
 
alter table DPS_DLV_DEPLOY_INSTANCE comment '部署实例表';
 
/*==============================================================*/
/* Table: DPS_DLV_DEPLOY_PIPELINE                               */
/*==============================================================*/
create table DPS_DLV_DEPLOY_PIPELINE
(
   PIPELINE_ID          varchar(64) not null,
   PIPELINE_NAME        varchar(64) comment '管道名称',
   ENV_ID               varchar(64) comment '环境ID',
   ASSEMBLY_RELEASE_ID  varchar(64) comment '装配发布ID',
   RELATED_PLATFORMS    text comment '关联平台',
   AGENT_ID             varchar(64) comment '代理ID',
   DESCRIPTION          text,
   SCRIPT_CONTENT       text comment '脚本',
   TRIGGER_TYPE         varchar(64) comment '触发类型',
   TRIGGER_REGEX        text comment '触发规则',
   PRIORITY             int comment '优先级',
   RETENTION            text comment '保留',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PIPELINE_ID)
);
 
alter table DPS_DLV_DEPLOY_PIPELINE comment '部署管道表';
 
/*==============================================================*/
/* Table: DPS_DLV_PLATFORM                                      */
/*==============================================================*/
create table DPS_DLV_PLATFORM
(
   PLATFORM_ID          varchar(64) not null,
   PLATFORM_NAME        varchar(64) comment '平台名称',
   ASSEMBLY_ID          varchar(64) comment '装配ID',
   PLATFORM_TP_ID       varchar(64) comment '平台模板ID',
   DESCRIPTION          text,
   TO_PLATFORMS         varchar(128) comment '平台应用',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PLATFORM_ID)
);
 
alter table DPS_DLV_PLATFORM comment '平台表';
 
/*==============================================================*/
/* Table: DPS_DLV_PLATFORM_RELEASE                              */
/*==============================================================*/
create table DPS_DLV_PLATFORM_RELEASE
(
   PLATFORM_RELEASE_ID  varchar(64) not null,
   PLATFORM_NAME        varchar(64) comment '平台名称',
   ASSEMBLY_RELEASE_ID  varchar(64) comment '装配发布ID',
   SOURCE_PLATFORM_ID   varchar(64) comment '平台来源ID',
   PLATFORM_TP_ID       varchar(64) comment '平台模板ID',
   DESCRIPTION          text,
   TO_PLATFORMS         varchar(128) comment '平台应用',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PLATFORM_RELEASE_ID)
);
 
alter table DPS_DLV_PLATFORM_RELEASE comment '平台发布表';
 
/*==============================================================*/
/* Table: DPS_DLV_PLATFORM_RESOURCE_PLAN                        */
/*==============================================================*/
create table DPS_DLV_PLATFORM_RESOURCE_PLAN
(
   RES_PLAN_ID          varchar(64) not null,
   PLATFORM_TP_ID       varchar(64) comment '平台模板ID',
   IS_DEFAULT           char comment '是否默认',
   DEPLOY_MODE          varchar(64) comment '部署方式',
   SERVICE_TYPE         varchar(64) comment '服务类型',
   RESOURCE_CAPICTIY    varchar(64) comment '资源容量表',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RES_PLAN_ID)
);
 
alter table DPS_DLV_PLATFORM_RESOURCE_PLAN comment '平台资源计划表';
 
/*==============================================================*/
/* Table: DPS_DLV_PLATFORM_TEMPLATE                             */
/*==============================================================*/
create table DPS_DLV_PLATFORM_TEMPLATE
(
   PLATFORM_TP_ID       varchar(64) not null,
   PLATFORM_TP_NAME     varchar(64) comment '平台模板名称',
   PLATFORM_TP_TYPE     varchar(64) comment '平台模板类型',
   DESCRIPTION          text comment '描述',
   COMPONENTS           text comment '组件',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PLATFORM_TP_ID)
);
 
alter table DPS_DLV_PLATFORM_TEMPLATE comment '平台模板表';
 
/*==============================================================*/
/* Table: DPS_DLV_R_DATACENTER_CLOUD_SERVICE_TYPE               */
/*==============================================================*/
create table DPS_DLV_R_DATACENTER_CLOUD_SERVICE_TYPE
(
   AGGREGATE_ID         varchar(64) not null,
   SERVICE_TYPE_ID      varchar(64) not null,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   primary key (AGGREGATE_ID, SERVICE_TYPE_ID)
);
 
alter table DPS_DLV_R_DATACENTER_CLOUD_SERVICE_TYPE comment '数据中心云服务类型表';
 
/*==============================================================*/
/* Table: DPS_INFRA_OPERATION_LOG                               */
/*==============================================================*/
create table DPS_INFRA_OPERATION_LOG
(
   LOG_ID               varchar(64) not null,
   ACTION_ID            varchar(64) comment '操作ID',
   ACTION_TYPE          varchar(64) comment '操作类型',
   ACTION_DESC          text,
   ENTITY_TYPE          varchar(64) comment '实体类型',
   ENTITY_PRIMARY_KEY   varchar(64) comment '实体主键Key',
   ENTITY_ID            varchar(64) comment '实体ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (LOG_ID)
);
 
alter table DPS_INFRA_OPERATION_LOG comment '操作日志表';
 
/*==============================================================*/
/* Table: DPS_INFRA_OPERATION_LOG_DETAIL                        */
/*==============================================================*/
create table DPS_INFRA_OPERATION_LOG_DETAIL
(
   DETAIL_ID            varchar(64) not null,
   LOG_ID               varchar(64) comment '日志ID',
   ATTR_NAME            varchar(64) not null comment '属性名称',
   OLD_VALUE            text comment '原值',
   NEW_VALUE            text comment '新值',
   DIFF                 mediumtext comment '差异',
   primary key (DETAIL_ID)
);
 
alter table DPS_INFRA_OPERATION_LOG_DETAIL comment '操作日志详情表';
 
/*==============================================================*/
/* Table: DPS_INFRA_R_TAG_OBJECT                                */
/*==============================================================*/
create table DPS_INFRA_R_TAG_OBJECT
(
   TAG_ID               varchar(64) not null,
   OBJECT_ID            varchar(64) not null comment '目标ID',
   OBJECT_TYPE          varchar(64) comment '目标类型',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (TAG_ID, OBJECT_ID)
);
 
alter table DPS_INFRA_R_TAG_OBJECT comment '标签目标关联表';
 
/*==============================================================*/
/* Table: DPS_INFRA_TAG                                         */
/*==============================================================*/
create table DPS_INFRA_TAG
(
   TAG_ID               varchar(64) not null comment '标签ID',
   TAG_NAME             varchar(64) not null comment '标签名称',
   CATALOG              varchar(64) comment '目录',
   OBJECT_TYPE          varchar(64) not null comment '类型',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (TAG_ID)
);
 
alter table DPS_INFRA_TAG comment '标签表';
 
/*==============================================================*/
/* Table: DPS_INFRA_TENANT                                      */
/*==============================================================*/
create table DPS_INFRA_TENANT
(
   TENANT_ID            varchar(64) not null,
   TENANT_NAME          varchar(64) not null comment '租户名称',
   MAIL                 varchar(64) comment '邮箱',
   PHONE                varchar(64) comment '手机号',
   ADDRESS              varchar(256) comment '地址',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   primary key (TENANT_ID)
);
 
alter table DPS_INFRA_TENANT comment '租户表';
 
/*==============================================================*/
/* Table: DPS_INFRA_THEME                                       */
/*==============================================================*/
create table DPS_INFRA_THEME
(
   THEME_ID             varchar(64) not null,
   THEME_NAME           varchar(64) not null comment '主题名称',
   TITLE                varchar(64) comment '标题',
   ICON                 blob comment '图标',
   LAYOUT               text comment '布局',
   UISERVICE_MAPPING    text comment '界面服务映射',
   SORT                 int comment '排序',
   SCOPE                varchar(64) comment '范围',
   ISLOCKED             char comment '是否锁定',
   IS_SYSTEM            char comment '是否系统',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (THEME_ID)
);
 
alter table DPS_INFRA_THEME comment '主题表';
 
/*==============================================================*/
/* Table: DPS_INFRA_UISERVICE                                   */
/*==============================================================*/
create table DPS_INFRA_UISERVICE
(
   UISERVICE_ID         varchar(64) not null,
   UISERVICE_NAME       varchar(64) not null comment '界面服务名称',
   UISERVICE_TYPE       varchar(64) comment '类型',
   TITLE                varchar(64) comment '标题',
   LOAD_TYPE            varchar(16) comment '加载类型',
   PARAMS               text comment '参数',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (UISERVICE_ID)
);
 
alter table DPS_INFRA_UISERVICE comment '界面服务表';
 
/*==============================================================*/
/* Table: DPS_INFRA_UISERVICE_TYPE                              */
/*==============================================================*/
create table DPS_INFRA_UISERVICE_TYPE
(
   UISERVICE_TYPE       varchar(64) not null,
   UISERVICE_TYPE_NAME  varchar(64) not null comment '界面服务类型名称',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (UISERVICE_TYPE)
);
 
alter table DPS_INFRA_UISERVICE_TYPE comment '界面服务类型表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKFLOW_STATUS                             */
/*==============================================================*/
create table DPS_INFRA_WORKFLOW_STATUS
(
   STATUS_ID            varchar(64) not null,
   STATUS_NAME          varchar(64) not null comment '状态名称',
   STATUS_LABEL         varchar(64) comment '状态名称',
   FLOW_TYPE            varchar(64) comment '工作流类型',
   SEQ                  int comment '序列',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (STATUS_ID)
);
 
alter table DPS_INFRA_WORKFLOW_STATUS comment '工作流状态表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKFLOW_TRANSITION                         */
/*==============================================================*/
create table DPS_INFRA_WORKFLOW_TRANSITION
(
   TRANSITION_ID        varchar(64) not null,
   TRANSLATION_NAME     varchar(64) comment '转换名称',
   FROM_STATUS          varchar(64) not null comment '来源状态',
   TO_STATUS            varchar(64) not null comment '工作项应用',
   FLOW_TYPE            varchar(64) comment '工作流类型',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   Column_9             char(10),
   primary key (TRANSITION_ID)
);
 
alter table DPS_INFRA_WORKFLOW_TRANSITION comment '工作项转换表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKFLOW_TYPE                               */
/*==============================================================*/
create table DPS_INFRA_WORKFLOW_TYPE
(
   FLOW_ID              varchar(64) not null,
   FLOW_NAME            varchar(64) not null comment '工作流名称',
   FLOW_LABEL           varchar(64) comment '工作流标签',
   START_STATUS         varchar(64) comment '开始状态',
   END_STATUS           varchar(64) comment '结束状态',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (FLOW_ID)
);
 
alter table DPS_INFRA_WORKFLOW_TYPE comment '工作流类型表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM                                    */
/*==============================================================*/
create table DPS_INFRA_WORKITEM
(
   WORKITEM_ID          varchar(64) not null,
   WORKITEM_NAME        varchar(64) not null comment '名称',
   WORKITEM_TYPE_ID     varchar(64) comment '类型ID',
   TITLE                varchar(64) comment '标题',
   OWNER_ID             varchar(64) comment '所属者ID',
   DESCRIPTION          text,
   PRIORITY             varchar(64) comment '权重',
   WORKITEM_STATUS      varchar(64) comment '状态',
   REASON               varchar(64) comment '原因',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (WORKITEM_ID)
);
 
alter table DPS_INFRA_WORKITEM comment '工作项表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_ATTACHMENT                         */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_ATTACHMENT
(
   ATTACHMENT_ID        varchar(64) not null,
   WORKITEM_ID          varchar(64) not null comment '关注项ID',
   FILE_NAME            varchar(64) comment '文件名',
   DISPLAY_NAME         varchar(64) comment '显示名称',
   URL                  varchar(128),
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTACHMENT_ID)
);
 
alter table DPS_INFRA_WORKITEM_ATTACHMENT comment '工作项附件表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_ATTACHMENT_FILING                  */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_ATTACHMENT_FILING
(
   ATTACHMENT_FILING_ID varchar(64) not null,
   FILING_ID            varchar(64) comment '归档ID',
   ATTACHMENT_ID        varchar(64) not null comment '附件ID',
   WORKITEM_ID          varchar(64) not null comment '工作项ID',
   FILE_NAME            varchar(64) comment '归档名称',
   DISPLAY_NAME         varchar(64) comment '显示名称',
   URL                  varchar(128) comment '归档URL',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTACHMENT_FILING_ID)
);
 
alter table DPS_INFRA_WORKITEM_ATTACHMENT_FILING comment '工作项附件归档表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_ATTR                               */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_ATTR
(
   ATTR_ID              varchar(64) not null,
   WORKITEM_ID          varchar(64),
   ATTR_DEFINITION_ID   varchar(64) comment '属性定义ID',
   INT_VALUE            int comment '整型值',
   FLOAT_VALUE          float comment '浮点值',
   DATETIME_VALUE       datetime comment '日期值',
   STRING_VALUE         varchar(128) comment '字符值',
   TEXT_VALUE           text comment '文本值',
   BLOB_VALUE           blob comment '大字段值',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_ID)
);
 
alter table DPS_INFRA_WORKITEM_ATTR comment '工作项属性表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_ATTR_DEFINITION                    */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_ATTR_DEFINITION
(
   ATTR_DEFINITION_ID   varchar(64) not null,
   ATTR_DEFINITION_NAME varchar(64) not null comment '属性定义名称',
   ATTR_DEFINITION_LABEL varchar(64) comment '显示名称',
   WORKITEM_TYPE_ID     varchar(64) comment '类型ID',
   TYPE                 varchar(64) comment '类型',
   SOURCE               char comment '来源',
   SORT                 int comment '排序',
   CATEGORY             varchar(64) comment '类别',
   IS_REQUIRED          char comment '是否必须',
   IS_INHERITABLE       char comment '是否可继承',
   IS_ENCRYPTED         char comment '是否加密',
   IS_IMMUTABLE         char comment '是否不可变',
   DISPLAY_FORMAT       text comment '显示格式',
   TIP                  text comment '提示信息',
   DEFAULT_VALUE        varchar(128) comment '默认值',
   FIELD_TYPE           varchar(64) comment '类型',
   OPTIONS              varchar(128) comment '选项',
   CHECK_POLICY         varchar(64) comment '检查策略',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_DEFINITION_ID)
);
 
alter table DPS_INFRA_WORKITEM_ATTR_DEFINITION comment '工作项属性定义表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_ATTR_FILING                        */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_ATTR_FILING
(
   ATTR_FILING_ID       varchar(64) not null,
   FILING_ID            varchar(64) comment '归档ID',
   ATTR_ID              varchar(64) comment '属性ID',
   WORKITEM_ID          varchar(64) comment '工作项ID',
   ATTR_DEFINITION_ID   varchar(64) comment '属性定义ID',
   INT_VALUE            int comment '整型值',
   FLOAT_VALUE          float comment '浮点值',
   DATETIME_VALUE       datetime comment '日期值',
   STRING_VALUE         varchar(128) comment '字符值',
   TEXT_VALUE           text comment '文本值',
   BLOB_VALUE           blob comment '大字段值',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ATTR_FILING_ID)
);
 
alter table DPS_INFRA_WORKITEM_ATTR_FILING comment '工作项属性归档表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_FILING                             */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_FILING
(
   FILING_ID            varchar(64) not null,
   WORKITEM_ID          varchar(64) comment '工作项ID',
   WORKITEM_NAME        varchar(64) comment '工作项名称',
   WORKITEM_TYPE_ID     varchar(64) comment '工作项类型ID',
   TITLE                varchar(64) comment '标题',
   OWNER_ID             varchar(64) comment '所有者ID',
   DESCRIPTION          text comment '描述',
   PRIORITY             varchar(64) comment '权重',
   FILING_STATUS        varchar(64) comment '归档状态',
   REASON               varchar(64) comment '原因',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (FILING_ID)
);
 
alter table DPS_INFRA_WORKITEM_FILING comment '工作项归档表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_RELATION                           */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_RELATION
(
   RELEATION_ID         varchar(64) not null,
   FROM_WORKITEM        varchar(64) not null comment '工作项来源',
   TO_WORKITEM          varchar(64) not null comment '工作项应用',
   RELEATION_TYPE_ID    varchar(64) comment '关系类型ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELEATION_ID)
);
 
alter table DPS_INFRA_WORKITEM_RELATION comment '工作项关系表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_RELATION_TYPE                      */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_RELATION_TYPE
(
   RELEATION_TYPE_ID    varchar(64) not null,
   FROM_WORKITEM_TYPE   varchar(64) not null comment '工作项类型来源',
   TO_WORKITEM_TYPE     varchar(64) not null comment '工作项类型应用',
   RELEATION_TYPE_NAME  varchar(64) comment '关系类型名称',
   RELEATION_TYPE_LABEL varchar(64) comment '关系类型名称',
   REVERSE_TYPE         varchar(64) comment '相反类型',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELEATION_TYPE_ID)
);
 
alter table DPS_INFRA_WORKITEM_RELATION_TYPE comment '工作项关系类型表';
 
/*==============================================================*/
/* Table: DPS_INFRA_WORKITEM_TYPE                               */
/*==============================================================*/
create table DPS_INFRA_WORKITEM_TYPE
(
   WORKITEM_TYPE_ID     varchar(64) not null,
   WORKITEM_TYPE_NAME   varchar(64) not null,
   WORKITEM_TYPE_LABEL  varchar(64) comment '显示名称',
   LAYOUT               varchar(128) comment '布局',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (WORKITEM_TYPE_ID)
);
 
alter table DPS_INFRA_WORKITEM_TYPE comment '工作项类型表';
 
/*==============================================================*/
/* Table: DPS_PDM_BUSINESS_DOMAIN                               */
/*==============================================================*/
create table DPS_PDM_BUSINESS_DOMAIN
(
   BUSINESS_DOMAIN_ID   varchar(64) not null comment '业务域ID（主键）',
   BUSINESS_DOMAIN_NAME varchar(64) not null comment '业务域名称',
   DESCRIPTION          text comment '业务域描述',
   CREATE_USER          varchar(64) comment '创建者',
   CREATE_TIME          datetime comment '创建时间',
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (BUSINESS_DOMAIN_ID)
);
 
alter table DPS_PDM_BUSINESS_DOMAIN comment '业务域';
 
/*==============================================================*/
/* Table: DPS_PDM_PRODUCT                                       */
/*==============================================================*/
create table DPS_PDM_PRODUCT
(
   PRODUCT_ID           varchar(64) not null,
   PRODUCT_NAME         varchar(64) not null comment '名称',
   PRODUCT_TYPE         varchar(16) not null comment '类型',
   PRODUCT_LINE_ID      varchar(64) not null comment '产品线ID',
   PRODUCT_STATUS       varchar(16) comment '状态',
   ICON                 blob comment '图标',
   TEMPLATE             varchar(64) comment '模板',
   DESCRIPTION          text,
   OWNER_ID             varchar(64) comment '所属者ID',
   ACL                  varchar(16) comment '当前版本',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PRODUCT_ID)
);
 
alter table DPS_PDM_PRODUCT comment '产品表';
 
/*==============================================================*/
/* Table: DPS_PDM_PRODUCT_LINE                                  */
/*==============================================================*/
create table DPS_PDM_PRODUCT_LINE
(
   PRODUCT_LINE_ID      varchar(64) not null,
   PRODUCT_LINE_NAME    varchar(64) not null,
   BUSINESS_DOMAIN_ID   varchar(64) comment '业务域ID',
   PROD_LINE_STATUS     varchar(16) comment '产品线状态',
   DESCRIPTION          text,
   OWNER_ID             varchar(64) comment '所属者ID',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PRODUCT_LINE_ID)
);
 
alter table DPS_PDM_PRODUCT_LINE comment '产品线表';
 
/*==============================================================*/
/* Table: DPS_PDM_PRODUCT_VERSION                               */
/*==============================================================*/
create table DPS_PDM_PRODUCT_VERSION
(
   VERSION_ID           varchar(64) not null,
   VARSION_NAME         varchar(64) not null comment '版本名称',
   PRODUCT_ID           varchar(64) comment '产品ID',
   DESCRIPTION          text,
   PLAN_BEGIN           date comment '计划开始日期',
   PLAN_END             date comment '截止日期',
   ACTUAL_END           date comment '实际截止日期',
   ACTUAL_BEGIN         date comment '实际开始日期',
   VERSION_STATUS       varchar(16) comment '版本状态',
   OWNER_ID             varchar(64) comment '所有者ID',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (VERSION_ID)
);
 
alter table DPS_PDM_PRODUCT_VERSION comment '产品版本表';
 
/*==============================================================*/
/* Table: DPS_PDM_REQURIMENT_BASELINE                           */
/*==============================================================*/
create table DPS_PDM_REQURIMENT_BASELINE
(
   BASELINE_ID          varchar(64) not null,
   BASELINE_NAME        varchar(64) not null comment '基线名称',
   FILING_ID            varchar(64) comment '归档ID',
   VERSION_ID           varchar(64) comment '版本ID',
   DESCRIPTION          text,
   BASELINE_STATUS      varchar(16) comment '基线状态',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (BASELINE_ID)
);
 
alter table DPS_PDM_REQURIMENT_BASELINE comment '需求基线表';
 
/*==============================================================*/
/* Table: DPS_PDM_R_PRODUCT_REQURIMENT                          */
/*==============================================================*/
create table DPS_PDM_R_PRODUCT_REQURIMENT
(
   PRODUCT_ID           varchar(64) not null,
   REQURIMENT_ID        varchar(64) not null comment '需求ID',
   VERSION_ID           varchar(64),
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   primary key (PRODUCT_ID, REQURIMENT_ID)
);
 
alter table DPS_PDM_R_PRODUCT_REQURIMENT comment '产品-需求关联表';
 
/*==============================================================*/
/* Table: DPS_PDM_R_VERSION_DELIVER                             */
/*==============================================================*/
create table DPS_PDM_R_VERSION_DELIVER
(
   RELEASE_ID           varchar(64) not null comment '发布ID',
   DELIVER_ID           varchar(64) not null comment '交付ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   primary key (RELEASE_ID, DELIVER_ID)
);
 
alter table DPS_PDM_R_VERSION_DELIVER comment '版本交付关联表';
 
/*==============================================================*/
/* Table: DPS_PDM_VERSION_RELEASE                               */
/*==============================================================*/
create table DPS_PDM_VERSION_RELEASE
(
   RELEASE_ID           varchar(64) not null,
   RELEASE_NAME         varchar(64) not null comment '发布名称',
   VERSION_ID           varchar(64) comment '版本ID',
   REQURIMENT_BASELINE_ID varchar(64) comment '需求发布ID',
   PROJECT_ID           varchar(64),
   DESCRIPTION          text,
   PLAN_RELEASE_TIME    date comment '计划发布时间',
   ACTUAL_RELEASE_TIME  date comment '实际发布时间',
   VERSION_STATUS       varchar(16) comment '版本状态',
   DEL_FLAG             char,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (RELEASE_ID)
);
 
alter table DPS_PDM_VERSION_RELEASE comment '版本发布表';
 
/*==============================================================*/
/* Table: DPS_PJM_ITERATION                                     */
/*==============================================================*/
create table DPS_PJM_ITERATION
(
   ITERATION_ID         varchar(64) not null,
   ITERATION_NAME       varchar(64) comment '迭代名称',
   PROJECT_ID           varchar(64) comment '项目ID',
   DESCRIPTION          varchar(64),
   ITERATION_LABEL      varchar(64) comment '迭代标签',
   PARENT_ITERATION     varchar(64) comment '父迭代',
   BEGIN_TIME           date comment '开始时间',
   END_TIME             date comment '结束时间',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (ITERATION_ID)
);
 
alter table DPS_PJM_ITERATION comment '迭代表';
 
/*==============================================================*/
/* Table: DPS_PJM_MILESTONE                                     */
/*==============================================================*/
create table DPS_PJM_MILESTONE
(
   STONE_ID             varchar(64) not null comment '里程碑ID',
   STONE_NAME           varchar(64) comment '名称',
   PROJECT_ID           varchar(64),
   DESCRIPTION          text,
   BEGIN_TIME           date comment '开始时间',
   END_TIME             date comment '截止时间',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (STONE_ID)
);
 
alter table DPS_PJM_MILESTONE comment '里程碑表';
 
/*==============================================================*/
/* Table: DPS_PJM_PROJECT                                       */
/*==============================================================*/
create table DPS_PJM_PROJECT
(
   PROJECT_ID           varchar(64) not null,
   PROJECT_NAME         varchar(64),
   PROJECT_TYPE         varchar(64),
   TEMPLATE             varchar(64) comment '项目模板',
   DESCRIPTION          text,
   ICON                 blob comment '项目图标',
   OWNER_ID             varchar(64) comment '所属者ID',
   PROJECT_STATUS       varchar(16) comment '项目状态',
   DEL_FLAG             char,
   ACL                  varchar(16),
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PROJECT_ID)
);
 
alter table DPS_PJM_PROJECT comment '项目表';
 
/*==============================================================*/
/* Table: DPS_PJM_R_PORJECT_MEETING                             */
/*==============================================================*/
create table DPS_PJM_R_PORJECT_MEETING
(
   PROJECT_ID           varchar(64) not null,
   MEETING_ID           varchar(64) not null,
   OBJECT_TYPE          varchar(64),
   OBJECT_ID            varchar(64),
   MEETING_STATUS       varchar(16),
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   primary key (PROJECT_ID, MEETING_ID)
);
 
/*==============================================================*/
/* Table: DPS_PJM_R_TASK_ITERATION                              */
/*==============================================================*/
create table DPS_PJM_R_TASK_ITERATION
(
   TASK_ID              varchar(64) not null,
   ITERATION_ID         varchar(64) not null comment '迭代ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   primary key (TASK_ID, ITERATION_ID)
);
 
alter table DPS_PJM_R_TASK_ITERATION comment '任务-迭代关系表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_CASE                                     */
/*==============================================================*/
create table DPS_PJM_TEST_CASE
(
   CASE_ID              varchar(64) not null comment '场景ID',
   SUITE_ID             varchar(64) comment '套件ID',
   CASE_TITIE           varchar(128),
   CASE_TYPE            varchar(64),
   PRE_COND             text comment '前置条件',
   STEPS                text comment '步骤',
   DESCRIPTION          text,
   ATTACHMENTS          text comment '附件',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (CASE_ID)
);
 
alter table DPS_PJM_TEST_CASE comment '测试场景表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_DATASET                                  */
/*==============================================================*/
create table DPS_PJM_TEST_DATASET
(
   DATASET_ID           varchar(64) not null,
   SUITE_ID             varchar(64) comment '套件ID',
   RUN_ID               varchar(64) comment '运行ID',
   PARAM_DEF            text comment '参数定义',
   DETAIL               text comment '详情',
   CREATE_TIME          datetime,
   CREATE_USER          varchar(64),
   TENANT_ID            varchar(64),
   primary key (DATASET_ID)
);
 
alter table DPS_PJM_TEST_DATASET comment '测试数据集表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_PLAN                                     */
/*==============================================================*/
create table DPS_PJM_TEST_PLAN
(
   PLAN_ID              varchar(64) not null comment '计划ID',
   PLAN_NAME            varchar(128) comment '计划名称',
   LINK_ID              varchar(64) comment '链接ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (PLAN_ID)
);
 
alter table DPS_PJM_TEST_PLAN comment '测试计划表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_RESULT                                   */
/*==============================================================*/
create table DPS_PJM_TEST_RESULT
(
   RESULT_ID            varchar(64) not null comment '结果ID',
   PLAN_ID              varchar(64) comment '计划ID',
   RUN_ID               varchar(64) comment '运行ID',
   SUITE_RESULT         text comment '套件结果',
   CASE_RESULT          text comment '情景结果',
   STEP_RESULT          text comment '步骤结果',
   EXEC_INFO            text comment '执行信息',
   REASON               text,
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RESULT_ID)
);
 
alter table DPS_PJM_TEST_RESULT comment '测试结果表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_RUN                                      */
/*==============================================================*/
create table DPS_PJM_TEST_RUN
(
   RUN_ID               varchar(64) not null comment '运行ID',
   BUILD_ID             varchar(64) comment '构建ID',
   DEPLOY_ID            varbinary(64),
   PLAN_ID              varchar(64) comment '计划ID',
   RUN_OBJECTS          text,
   DESCRIPTION          text,
   BEGIN_TIME           date,
   END_TIME             date,
   PARAMS               text comment '参数',
   TEST_TYPE            varchar(64) comment '测试类型',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   Column_14            char(10),
   primary key (RUN_ID)
);
 
alter table DPS_PJM_TEST_RUN comment '测试运行表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_STEP                                     */
/*==============================================================*/
create table DPS_PJM_TEST_STEP
(
   STEP_ID              varchar(64) not null comment '步骤ID',
   CASE_ID              varchar(64) comment '场景ID',
   TITLE                varchar(128) comment '标题',
   PRE_COND             text comment '前置条件',
   EXPECT_RESULT        text comment '期望结果',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (STEP_ID)
);
 
alter table DPS_PJM_TEST_STEP comment '测试步骤表';
 
/*==============================================================*/
/* Table: DPS_PJM_TEST_SUITE                                    */
/*==============================================================*/
create table DPS_PJM_TEST_SUITE
(
   SUITE_ID             varchar(64) not null comment '套件ID',
   SUITE_NAME           varchar(128) comment '套件名称',
   LINK_ID              varchar(64) comment '可link到userstory',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (SUITE_ID)
);
 
alter table DPS_PJM_TEST_SUITE comment '测试套件表';
 
/*==============================================================*/
/* Table: DPS_R_PJM_ROLE_PROJECT                                */
/*==============================================================*/
create table DPS_R_PJM_ROLE_PROJECT
(
   ROLE_ID              varchar(64) not null comment '角色ID',
   PROJECT_ID           varchar(64) not null comment '项目ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   UPDATE_USER          varchar(64),
   UPDATE_TIME          datetime,
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (ROLE_ID, PROJECT_ID)
);
 
alter table DPS_R_PJM_ROLE_PROJECT comment '用于描述coframe中的每一个role属于哪一个project';
 
/*==============================================================*/
/* Table: DPS_R_PRODUCT_CODE                                    */
/*==============================================================*/
create table DPS_R_PRODUCT_CODE
(
   RELATION_ID          varchar(64) not null,
   PRODUCT_VERSION_ID   varchar(64) comment '版本ID',
   REPO_ID              varchar(64) comment '代码库ID',
   BRANCH_ID            varchar(64) comment '分支ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELATION_ID)
);
 
alter table DPS_R_PRODUCT_CODE comment '产品-代码关联表';
 
/*==============================================================*/
/* Table: DPS_R_PRODUCT_PROJECT                                 */
/*==============================================================*/
create table DPS_R_PRODUCT_PROJECT
(
   RELATION_ID          varchar(64),
   PRODUCT_ID           varchar(64),
   PRODUCT_VERSION_ID   varchar(64),
   PROJECT_ID           varchar(64),
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64)
);
 
alter table DPS_R_PRODUCT_PROJECT comment '产品项目关联表';
 
/*==============================================================*/
/* Table: DPS_R_PROJECT_CODE                                    */
/*==============================================================*/
create table DPS_R_PROJECT_CODE
(
   RELATION_ID          varchar(64) not null,
   PROJECT_ID           varchar(64),
   REPO_ID              varchar(64) comment '代码库ID',
   BRANCH_ID            varchar(64) comment '分支ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   TENANT_ID            varchar(64),
   primary key (RELATION_ID)
);
 
alter table DPS_R_PROJECT_CODE comment '项目-代码关联表';
 
/*==============================================================*/
/* Table: DPS_R_UC_ROLE_FUNC_TEMPLATE                           */
/*==============================================================*/
create table DPS_R_UC_ROLE_FUNC_TEMPLATE
(
   ROLE_TEMPLATE_ID     varchar(64) not null comment '角色模板ID',
   FUNCTION_ID          varchar(64) not null comment '功能ID',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   UPDATE_USER          varchar(64),
   UPDATE_TIME          datetime,
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (ROLE_TEMPLATE_ID, FUNCTION_ID)
);
 
alter table DPS_R_UC_ROLE_FUNC_TEMPLATE comment '角色-功能关系模板表';
 
/*==============================================================*/
/* Table: DPS_R_UC_ROLE_TYPE                                    */
/*==============================================================*/
create table DPS_R_UC_ROLE_TYPE
(
   ROLE_ID              varchar(64) not null comment '角色ID',
   ROLE_TYPE            varchar(64) comment '角色类型',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   UPDATE_USER          varchar(64),
   UPDATE_TIME          datatime,
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (ROLE_ID)
);
 
alter table DPS_R_UC_ROLE_TYPE comment '用于确定某一个角色属于哪种类型（平台级角色、项目级角色）';
 
/*==============================================================*/
/* Table: DPS_UC_ROLE_TEMPLATE                                  */
/*==============================================================*/
create table DPS_UC_ROLE_TEMPLATE
(
   ROLE_TEMPLATE_ID     varchar(64) not null comment '角色模板ID',
   ROLE_TEMPLATE_CODE   varchar(64) comment '角色模板编码',
   ROLE_TEMPLATE_NAME   varchar(64) comment '角色模板名称',
   ROLE_TEMPLATE_TYPE   varchar(64) comment '模板角色类型：规划类，研发类',
   CREATE_USER          varchar(64),
   CREATE_TIME          datetime,
   UPDATE_USER          varchar(64),
   UPDATE_TIME          datetime,
   TENANT_ID            varchar(64) comment '租户ID',
   primary key (ROLE_TEMPLATE_ID)
);
 
alter table DPS_UC_ROLE_TEMPLATE comment '初始化项目角色模板表';
