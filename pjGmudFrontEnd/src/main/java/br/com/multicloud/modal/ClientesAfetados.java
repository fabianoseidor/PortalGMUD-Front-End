package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class ClientesAfetados implements Serializable{

	private static final long serialVersionUID = -954884151668286477L;

	private Long id_clientes_af;
	private Long id_cliente_portal;
	private String nome_cliente;
	private LocalDateTime dt_criacao;

	public Long getId_clientes_af() {
		return id_clientes_af;
	}

	public void setId_clientes_af(Long id_clientes_af) {
		this.id_clientes_af = id_clientes_af;
	}

	public Long getId_cliente_portal() {
		return id_cliente_portal;
	}

	public void setId_cliente_portal(Long id_cliente_portal) {
		this.id_cliente_portal = id_cliente_portal;
	}

	public String getNome_cliente() {
		return nome_cliente;
	}

	public void setNome_cliente(String nome_cliente) {
		this.nome_cliente = nome_cliente;
	}

	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_cliente_portal);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClientesAfetados other = (ClientesAfetados) obj;
		return Objects.equals(id_cliente_portal, other.id_cliente_portal);
	}

	@Override
	public String toString() {
		return "ClientesAfetados [id_clientes_af=" + id_clientes_af + ", id_cliente_portal=" + id_cliente_portal
				+ ", nome_cliente=" + nome_cliente + ", dt_criacao=" + dt_criacao + "]";
	}


}
