҆
��
:
Add
x"T
y"T
z"T"
Ttype:
2	
A
AddV2
x"T
y"T
z"T"
Ttype:
2	��
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
�
AudioMicrofrontend	
audio
filterbanks"out_type"
sample_rateint�}"
window_sizeint"
window_stepint
"
num_channelsint " 
upper_band_limitfloat% `�E" 
lower_band_limitfloat%  �B"
smoothing_bitsint
"
even_smoothingfloat%���<"
odd_smoothingfloat%��u="$
min_signal_remainingfloat%��L="
enable_pcanbool( "
pcan_strengthfloat%33s?"
pcan_offsetfloat%  �B"
	gain_bitsint"

enable_logbool("
scale_shiftint"
left_contextint "
right_contextint "
frame_strideint"
zero_paddingbool( "
	out_scaleint"
out_typetype0:
2
p
AudioSpectrogram	
input
spectrogram"
window_sizeint"
strideint"
magnitude_squaredbool( 
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

�
	DecodeWav
contents	
audio
sample_rate"$
desired_channelsint���������"#
desired_samplesint���������
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*1.15.22v1.15.2-0-g5d80e1e8e6�f
I
wav_dataPlaceholder*
dtype0*
_output_shapes
: *
shape: 
}
decoded_sample_data	DecodeWavwav_data*
desired_samples�}*!
_output_shapes
:	�}: *
desired_channels
�
AudioSpectrogramAudioSpectrogramdecoded_sample_data*
window_size�*
magnitude_squared(*#
_output_shapes
:1�*
stride�
J
Mul/yConst*
valueB
 * ��F*
dtype0*
_output_shapes
: 
P
MulMuldecoded_sample_dataMul/y*
_output_shapes
:	�}*
T0
Z
CastCastMul*
_output_shapes
:	�}*

DstT0*

SrcT0*
Truncate( 
`
Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
[
ReshapeReshapeCastReshape/shape*
Tshape0*
_output_shapes	
:�}*
T0
�
AudioMicrofrontendAudioMicrofrontendReshape*
pcan_strength%33s?*
enable_pcan(*
even_smoothing%���<*
lower_band_limit%  �B*
	out_scale*
zero_padding( *
window_size*
num_channels(*

enable_log(*
odd_smoothing%��u=*
scale_shift*
out_type0*
upper_band_limit% `�E*
frame_stride*
pcan_offset%  �B*
min_signal_remaining%��L=*
right_context *
smoothing_bits
*
window_step*
	gain_bits*
sample_rate�}*
_output_shapes

:1(*
left_context 
L
Mul_1/yConst*
valueB
 *   =*
dtype0*
_output_shapes
: 
R
Mul_1MulAudioMicrofrontendMul_1/y*
_output_shapes

:1(*
T0
`
Reshape_1/shapeConst*
_output_shapes
:*
valueB"�����  *
dtype0
d
	Reshape_1ReshapeMul_1Reshape_1/shape*
T0*
Tshape0*
_output_shapes
:	�
h
Reshape_2/shapeConst*%
valueB"����1   (      *
dtype0*
_output_shapes
:
o
	Reshape_2Reshape	Reshape_1Reshape_2/shape*
T0*
Tshape0*&
_output_shapes
:1(
�
0first_weights/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*%
valueB"
            * 
_class
loc:@first_weights
�
/first_weights/Initializer/truncated_normal/meanConst*
valueB
 *    * 
_class
loc:@first_weights*
dtype0*
_output_shapes
: 
�
1first_weights/Initializer/truncated_normal/stddevConst*
valueB
 *
�#<* 
_class
loc:@first_weights*
dtype0*
_output_shapes
: 
�
:first_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormal0first_weights/Initializer/truncated_normal/shape*
T0* 
_class
loc:@first_weights*
seed2 *
dtype0*&
_output_shapes
:
*

seed 
�
.first_weights/Initializer/truncated_normal/mulMul:first_weights/Initializer/truncated_normal/TruncatedNormal1first_weights/Initializer/truncated_normal/stddev*
T0* 
_class
loc:@first_weights*&
_output_shapes
:

�
*first_weights/Initializer/truncated_normalAdd.first_weights/Initializer/truncated_normal/mul/first_weights/Initializer/truncated_normal/mean*&
_output_shapes
:
*
T0* 
_class
loc:@first_weights
�
first_weights
VariableV2*
dtype0*&
_output_shapes
:
*
shared_name * 
_class
loc:@first_weights*
	container *
shape:

�
first_weights/AssignAssignfirst_weights*first_weights/Initializer/truncated_normal*&
_output_shapes
:
*
use_locking(*
T0* 
_class
loc:@first_weights*
validate_shape(
�
first_weights/readIdentityfirst_weights*&
_output_shapes
:
*
T0* 
_class
loc:@first_weights
�
first_bias/Initializer/zerosConst*
valueB*    *
_class
loc:@first_bias*
dtype0*
_output_shapes
:
�

first_bias
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name *
_class
loc:@first_bias
�
first_bias/AssignAssign
first_biasfirst_bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@first_bias*
validate_shape(*
_output_shapes
:
k
first_bias/readIdentity
first_bias*
T0*
_class
loc:@first_bias*
_output_shapes
:
�
Conv2DConv2D	Reshape_2first_weights/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*&
_output_shapes
:
V
addAddV2Conv2Dfirst_bias/read*
T0*&
_output_shapes
:
B
ReluReluadd*
T0*&
_output_shapes
:
`
Reshape_3/shapeConst*
valueB"�����  *
dtype0*
_output_shapes
:
c
	Reshape_3ReshapeReluReshape_3/shape*
_output_shapes
:	�*
T0*
Tshape0
�
3final_fc_weights/Initializer/truncated_normal/shapeConst*
valueB"�     *#
_class
loc:@final_fc_weights*
dtype0*
_output_shapes
:
�
2final_fc_weights/Initializer/truncated_normal/meanConst*
valueB
 *    *#
_class
loc:@final_fc_weights*
dtype0*
_output_shapes
: 
�
4final_fc_weights/Initializer/truncated_normal/stddevConst*
valueB
 *
�#<*#
_class
loc:@final_fc_weights*
dtype0*
_output_shapes
: 
�
=final_fc_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormal3final_fc_weights/Initializer/truncated_normal/shape*

seed *
T0*#
_class
loc:@final_fc_weights*
seed2 *
dtype0*
_output_shapes
:	�
�
1final_fc_weights/Initializer/truncated_normal/mulMul=final_fc_weights/Initializer/truncated_normal/TruncatedNormal4final_fc_weights/Initializer/truncated_normal/stddev*
T0*#
_class
loc:@final_fc_weights*
_output_shapes
:	�
�
-final_fc_weights/Initializer/truncated_normalAdd1final_fc_weights/Initializer/truncated_normal/mul2final_fc_weights/Initializer/truncated_normal/mean*
T0*#
_class
loc:@final_fc_weights*
_output_shapes
:	�
�
final_fc_weights
VariableV2*
	container *
shape:	�*
dtype0*
_output_shapes
:	�*
shared_name *#
_class
loc:@final_fc_weights
�
final_fc_weights/AssignAssignfinal_fc_weights-final_fc_weights/Initializer/truncated_normal*#
_class
loc:@final_fc_weights*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0
�
final_fc_weights/readIdentityfinal_fc_weights*
T0*#
_class
loc:@final_fc_weights*
_output_shapes
:	�
�
final_fc_bias/Initializer/zerosConst*
valueB*    * 
_class
loc:@final_fc_bias*
dtype0*
_output_shapes
:
�
final_fc_bias
VariableV2*
dtype0*
_output_shapes
:*
shared_name * 
_class
loc:@final_fc_bias*
	container *
shape:
�
final_fc_bias/AssignAssignfinal_fc_biasfinal_fc_bias/Initializer/zeros* 
_class
loc:@final_fc_bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
t
final_fc_bias/readIdentityfinal_fc_bias*
_output_shapes
:*
T0* 
_class
loc:@final_fc_bias
�
MatMulMatMul	Reshape_3final_fc_weights/read*
_output_shapes

:*
transpose_a( *
transpose_b( *
T0
S
add_1AddV2MatMulfinal_fc_bias/read*
_output_shapes

:*
T0
I
labels_softmaxSoftmaxadd_1*
T0*
_output_shapes

:
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
shape: *
dtype0
�
save/SaveV2/tensor_namesConst*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights*
dtype0*
_output_shapes
:
k
save/SaveV2/shape_and_slicesConst*
valueBB B B B *
dtype0*
_output_shapes
:
�
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesfinal_fc_biasfinal_fc_weights
first_biasfirst_weights*
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
_class
loc:@save/Const*
_output_shapes
: *
T0
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights
}
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B B B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*$
_output_shapes
::::*
dtypes
2
�
save/AssignAssignfinal_fc_biassave/RestoreV2*
use_locking(*
T0* 
_class
loc:@final_fc_bias*
validate_shape(*
_output_shapes
:
�
save/Assign_1Assignfinal_fc_weightssave/RestoreV2:1*
use_locking(*
T0*#
_class
loc:@final_fc_weights*
validate_shape(*
_output_shapes
:	�
�
save/Assign_2Assign
first_biassave/RestoreV2:2*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@first_bias*
validate_shape(
�
save/Assign_3Assignfirst_weightssave/RestoreV2:3*
use_locking(*
T0* 
_class
loc:@first_weights*
validate_shape(*&
_output_shapes
:

V
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3
[
save_1/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
r
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
dtype0*
_output_shapes
: *
shape: 
i
save_1/ConstPlaceholderWithDefaultsave_1/filename*
shape: *
dtype0*
_output_shapes
: 
�
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_a800bee608104b98b2eb9d72166cfe56/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
_output_shapes
: *
	separator *
N
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
�
save_1/SaveV2/tensor_namesConst"/device:CPU:0*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights*
dtype0*
_output_shapes
:
|
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B B B 
�
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesfinal_fc_biasfinal_fc_weights
first_biasfirst_weights"/device:CPU:0*
dtypes
2
�
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
�
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
�
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(
�
save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
�
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*O
valueFBDBfinal_fc_biasBfinal_fc_weightsB
first_biasBfirst_weights*
dtype0*
_output_shapes
:

!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B B B 
�
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*$
_output_shapes
::::*
dtypes
2
�
save_1/AssignAssignfinal_fc_biassave_1/RestoreV2* 
_class
loc:@final_fc_bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save_1/Assign_1Assignfinal_fc_weightssave_1/RestoreV2:1*
validate_shape(*
_output_shapes
:	�*
use_locking(*
T0*#
_class
loc:@final_fc_weights
�
save_1/Assign_2Assign
first_biassave_1/RestoreV2:2*
T0*
_class
loc:@first_bias*
validate_shape(*
_output_shapes
:*
use_locking(
�
save_1/Assign_3Assignfirst_weightssave_1/RestoreV2:3*
use_locking(*
T0* 
_class
loc:@first_weights*
validate_shape(*&
_output_shapes
:

b
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3
1
save_1/restore_allNoOp^save_1/restore_shard"�B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"�
trainable_variables��
m
first_weights:0first_weights/Assignfirst_weights/read:02,first_weights/Initializer/truncated_normal:08
V
first_bias:0first_bias/Assignfirst_bias/read:02first_bias/Initializer/zeros:08
y
final_fc_weights:0final_fc_weights/Assignfinal_fc_weights/read:02/final_fc_weights/Initializer/truncated_normal:08
b
final_fc_bias:0final_fc_bias/Assignfinal_fc_bias/read:02!final_fc_bias/Initializer/zeros:08"�
	variables��
m
first_weights:0first_weights/Assignfirst_weights/read:02,first_weights/Initializer/truncated_normal:08
V
first_bias:0first_bias/Assignfirst_bias/read:02first_bias/Initializer/zeros:08
y
final_fc_weights:0final_fc_weights/Assignfinal_fc_weights/read:02/final_fc_weights/Initializer/truncated_normal:08
b
final_fc_bias:0final_fc_bias/Assignfinal_fc_bias/read:02!final_fc_bias/Initializer/zeros:08*~
serving_defaultk
#
input
Reshape_1:0	�(
output
labels_softmax:0tensorflow/serving/predict