package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class MudancaClientesAfetados implements Serializable{

	private static final long serialVersionUID = -8032979711028967741L;
	
	private Long id_mud_cli_afetados;
	private Mudanca mudanca;
	private ClientesAfetados clientesAfetados;
	private LocalDateTime dt_criacao;

	public Long getId_mud_cli_afetados() {
		return id_mud_cli_afetados;
	}

	public void setId_mud_cli_afetados(Long id_mud_cli_afetados) {
		this.id_mud_cli_afetados = id_mud_cli_afetados;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	public Mudanca getMudanca() {
		return mudanca;
	}

	public void setMudanca(Mudanca mudanca) {
		this.mudanca = mudanca;
	}

	public ClientesAfetados getClientesAfetados() {
		return clientesAfetados;
	}

	public void setClientesAfetados(ClientesAfetados clientesAfetados) {
		this.clientesAfetados = clientesAfetados;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_mud_cli_afetados);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MudancaClientesAfetados other = (MudancaClientesAfetados) obj;
		return Objects.equals(id_mud_cli_afetados, other.id_mud_cli_afetados);
	}

	@Override
	public String toString() {
		return "MudancaClientesAfetados [id_mud_cli_afetados=" + id_mud_cli_afetados + ", mudanca=" + mudanca
				+ ", clientesAfetados=" + clientesAfetados + ", dt_criacao=" + dt_criacao + "]";
	}


	
}
