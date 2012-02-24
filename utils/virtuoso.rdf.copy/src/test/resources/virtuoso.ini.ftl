;
;  virtuoso.ini
;
;  Configuration file for the OpenLink Virtuoso VDBMS Server
;
;  To learn more about this product, or any other product in our
;  portfolio, please check out our web site at:
;
;      http://virtuoso.openlinksw.com/
;
;  or contact us at:
;
;      general.information@openlinksw.com
;
;  If you have any technical questions, please contact our support
;  staff at:
;
;      technical.support@openlinksw.com
;

;
;  Database setup
;
[Database]
DatabaseFile			= virtuoso.db
ErrorLogFile			= virtuoso.log
LockFile			= virtuoso.lck
TransactionFile			= virtuoso.trx
xa_persistent_file		= virtuoso.pxa
ErrorLogLevel			= 7
FileExtend			= 200
MaxCheckpointRemap		= 2000
Striping			= 0
TempStorage			= TempDatabase


[TempDatabase]
DatabaseFile			= virtuoso-temp.db
TransactionFile			= virtuoso-temp.trx
MaxCheckpointRemap		= 2000
Striping			= 0


;
;  Server parameters
;
[Parameters]
ServerPort			= ${isql_port}
LiteMode			= 0
DisableUnixSocket		= 1
DisableTcpSocket		= 0
;SSLServerPort			= 2111
;SSLCertificate			= cert.pem
;SSLPrivateKey			= pk.pem
;X509ClientVerify		= 0
;X509ClientVerifyDepth		= 0
;X509ClientVerifyCAFile		= ca.pem
ServerThreads			= 20
CheckpointInterval		= 60
O_DIRECT			= 0
NumberOfBuffers			= 2000
MaxDirtyBuffers			= 1200
CaseMode			= 2
MaxStaticCursorRows		= 5000
CheckpointAuditTrail		= 0
AllowOSCalls			= 0
SchedulerInterval		= 10
DirsAllowed			= . ;, /usr/local/virtuoso-opensource/share/virtuoso/vad
ThreadCleanupInterval		= 0
ThreadThreshold			= 10
ResourcesCleanupInterval	= 0
FreeTextBatchSize		= 100000
SingleCPU			= 0
; for our purposes, it shouldn't matter what this is set to
VADInstallDir			= /usr/local/virtuoso-opensource/share/virtuoso/vad/
PrefixResultNames               = 0
RdfFreeTextRulesSize		= 100
IndexTreeMaps			= 256



[HTTPServer]
ServerPort			= ${http_port}
ServerRoot			= ${http_root_dir}
ServerThreads			= 20
DavRoot				= DAV
EnabledDavVSP			= 0
HTTPProxyEnabled		= 0
TempASPXDir			= 0
DefaultMailServer		= localhost:25
ServerThreads			= 10
MaxKeepAlives			= 10
KeepAliveTimeout		= 10
MaxCachedProxyConnections	= 10
ProxyConnectionCacheTimeout	= 15
HTTPThreadSize			= 280000
HttpPrintWarningsInOutput	= 0
Charset				= UTF-8

[AutoRepair]
BadParentLinks			= 0

[Client]
SQL_PREFETCH_ROWS		= 100
SQL_PREFETCH_BYTES		= 16000
SQL_QUERY_TIMEOUT		= 0
SQL_TXN_TIMEOUT			= 0
;SQL_NO_CHAR_C_ESCAPE		= 1
;SQL_UTF8_EXECS			= 0
;SQL_NO_SYSTEM_TABLES		= 0
;SQL_BINARY_TIMESTAMP		= 1
;SQL_ENCRYPTION_ON_PASSWORD	= -1

[VDB]
ArrayOptimization		= 0
NumArrayParameters		= 10
VDBDisconnectTimeout		= 1000
KeepConnectionOnFixedThread	= 0

[Replication]
ServerName			= db-BEN-LAPTOP
ServerEnable			= 1
QueueMax			= 50000


;
;  Striping setup
;
;  These parameters have only effect when Striping is set to 1 in the
;  [Database] section, in which case the DatabaseFile parameter is ignored.
;
;  With striping, the database is spawned across multiple segments
;  where each segment can have multiple stripes.
;
;  Format of the lines below:
;    Segment<number> = <size>, <stripe file name> [, <stripe file name> .. ]
;
;  <number> must be ordered from 1 up.
;
;  The <size> is the total size of the segment which is equally divided
;  across all stripes forming  the segment. Its specification can be in
;  gigabytes (g), megabytes (m), kilobytes (k) or in database blocks
;  (b, the default)
;
;  Note that the segment size must be a multiple of the database page size
;  which is currently 8k. Also, the segment size must be divisible by the
;  number of stripe files forming  the segment.
;
;  The example below creates a 200 meg database striped on two segments
;  with two stripes of 50 meg and one of 100 meg.
;
;  You can always add more segments to the configuration, but once
;  added, do not change the setup.
;
[Striping]
Segment1			= 100M, db-seg1-1.db, db-seg1-2.db
Segment2			= 100M, db-seg2-1.db
;...

;[TempStriping]
;Segment1			= 100M, db-seg1-1.db, db-seg1-2.db
;Segment2			= 100M, db-seg2-1.db
;...

;[Ucms]
;UcmPath			= <path>
;Ucm1				= <file>
;Ucm2				= <file>
;...


[Zero Config]
ServerName			= virtuoso (BEN-LAPTOP)
;ServerDSN			= ZDSN
;SSLServerName			=
;SSLServerDSN			=


[Mono]
;MONO_TRACE			= Off
;MONO_PATH			= <path_here>
;MONO_ROOT			= <path_here>
;MONO_CFG_DIR			= <path_here>
;virtclr.dll			=


[URIQA]
DynamicLocal			= 1
DefaultHost			= localhost:${http_port}


[SPARQL]
;ExternalQuerySource		= 1
;ExternalXsltSource 		= 1
;DefaultGraph      		= http://localhost:${http_port}/dataspace
;ImmutableGraphs    		= http://localhost:${http_port}/dataspace
ResultSetMaxRows           	= 10000
MaxQueryCostEstimationTime 	= 400	; in seconds
MaxQueryExecutionTime      	= 60	; in seconds
DefaultQuery               	= select distinct ?Concept where {[] a ?Concept}
DeferInferenceRulesInit    	= 0  ; controls inference rules loading
;PingService       		= http://rpc.pingthesemanticweb.com/


;[Plugins]
;LoadPath			= /usr/local/virtuoso-opensource/lib/virtuoso/hosting
;Load1				= plain, wikiv
;Load2				= plain, mediawiki
;Load3				= plain, creolewiki
;Load4			= plain, im
;Load5		= plain, wbxml2
;Load6			= plain, hslookup
;Load7			= attach, libphp5.so
;Load8			= Hosting, hosting_php.so
;Load9			= Hosting,hosting_perl.so
;Load10		= Hosting,hosting_python.so
;Load11		= Hosting,hosting_ruby.so
;Load12				= msdtc,msdtc_sample