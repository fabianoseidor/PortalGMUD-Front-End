package br.com.multicloud.modal.enums;

public enum StatusRdm {
	ABERTA("Aberta"),
	AGUARDANDO_APROVACOES("Aguardando Aprovações"),
	APROVADA("Aprovadas"),
	CANCELADA("Cancelada"),
	REJEITADA("Rejeitada"),
	AGUARDANDO_EXECUCAO("Aguardando Execução"),
	EM_EXECUCAO("Em Execução"),
	MUDANCA_FIM_SUCESSO("Mudança Concluida com Sucesso"),
	MUDANCA_FIM_RESSALVA("Mudança Concluida com Ressalva"),
	MUDANCA_FIM_FALHA("Mudança Concluida com Falha"),
	MUDANCA_ABORTADA("Mudança Concluida com Abortada"),
	MUDANCA_ABORTADA_ROLLBACK("Mudança Concluida com Abortada com Rollback");
	
	private String statusRdm;
	
	private StatusRdm( String desc) {
		this.statusRdm = desc;
	}

	public String getStatusRdm() {
		return statusRdm;
	}

   @Override
    public String toString() {
	  return this.statusRdm;
   }
	
}
