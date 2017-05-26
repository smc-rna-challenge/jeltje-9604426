baseCommand: [salmon, quant]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- default: true
  id: gcbias
  inputBinding: {prefix: --gcBias}
  type: boolean
- id: index
  inputBinding: {prefix: --index}
  type: Directory
- default: IU
  id: libtype
  inputBinding: {position: 2, prefix: --libType}
  type: string
- id: mate1
  inputBinding: {position: 2, prefix: --mates1}
  type: File
- id: mate2
  inputBinding: {position: 3, prefix: --mates2}
  type: File
- default: quant.sf
  id: outfile
  type: ['null', string]
- default: salmon.output
  id: output
  inputBinding: {prefix: --output}
  type: ['null', string]
- default: 8
  id: threads
  inputBinding: {prefix: --threads}
  type: int
- default: true
  id: useVBOpt
  inputBinding: {prefix: --useVBOpt}
  type: boolean
outputs:
- id: isoforms
  outputBinding: {glob: $(inputs.output)/$(inputs.outfile)}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: jeltje/salmon}
