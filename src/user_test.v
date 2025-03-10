module clever

fn test_get_self() {
	client := new_client() or {
		assert false, 'Failed to create client: ${err}'
		return
	}

	response := client.get_self() or {
		assert false, 'Failed to get self profile: ${err}'
		return
	}

	assert response.len > 0, 'Empty response from get_self()'
	assert response.starts_with('{'), 'Response should be a JSON object'
}

fn test_get_summary() {
	client := new_client() or {
		assert false, 'Failed to create client: ${err}'
		return
	}

	response := client.get_summary() or {
		assert false, 'Failed to get summary: ${err}'
		return
	}

	assert response.len > 0, 'Empty response from get_summary()'
	assert response.starts_with('{'), 'Response should be a JSON object'
}
