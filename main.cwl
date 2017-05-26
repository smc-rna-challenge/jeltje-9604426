class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jeltje@synapse.org,
  'foaf:name': jeltje}
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: cut/cutfile, type: File}
requirements:
- {class: MultipleInputFeatureRequirement}
- {class: StepInputExpressionRequirement}
- {class: InlineJavascriptRequirement}
steps:
- id: cut
  in:
  - {id: cutfile, valueFrom: $('TPM.txt')}
  - {id: infile, source: salmon/isoforms}
  out: [cutfile]
  run: cut.cwl
- id: salmon
  in:
  - {id: index, source: tar/output}
  - {id: mate1, source: TUMOR_FASTQ_1}
  - {id: mate2, source: TUMOR_FASTQ_2}
  out: [isoforms]
  run: salmon.cwl
- id: tar
  in:
  - {id: outdir, valueFrom: $('salmon-index')}
  - {id: tarfile, source: index}
  out: [output]
  run: tar.cwl
